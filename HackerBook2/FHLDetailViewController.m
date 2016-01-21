//
//  FHLDetailViewController.m
//  HackerBook2
//
//  Created by Fco. Javier Honrubia Lopez on 13/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "FHLDetailViewController.h"
#import "FHLSimplePDFViewController.h"
#import "FHLNotesViewController.h"
#import "FHLBook.h"
#import "FHLPhotoEntity.h"
#import "FHLAuthor.h"
#import "FHLTag.h"
#import "FHLAnnotation.h"

@interface FHLDetailViewController ()

@property (strong, nonatomic) FHLBook *selectedBook;
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation FHLDetailViewController

#pragma mark - Class Methods
+ (NSString *)favoriteSwitchChangeKey {return @"favoriteSwitchChangeKey";}

#pragma mark -Init
- (id) initWithBook:(FHLBook *) book context:(NSManagedObjectContext *)context{
    
    if (self = [self init]) {
        _selectedBook = book;
        _context = context;
    }
    return self;
}

#pragma mark - View LifeCycle

-(void)viewWillAppear:(BOOL)animated{
    
    self.titleBook.text = self.selectedBook.title;
    self.cover.image = self.selectedBook.photo.photo;
    
    self.authors.text = [[self.selectedBook obtainAuthors] componentsJoinedByString:@","];
    self.tags.text = [[self.selectedBook obtainTags] componentsJoinedByString:@","];
    
    if (self.selectedBook.isFavoriteValue == YES) {
        [self.isFavorite setOn:YES animated:YES];
    } else {
        [self.isFavorite setOn:NO animated:YES];
    }

    self.title = @"Detalles";
    
}

#pragma mark -Actions
- (IBAction)obtainPDF:(id)sender {
    
    FHLSimplePDFViewController *pdf = [[FHLSimplePDFViewController alloc] initWithBook:self.selectedBook];
    
    [self.navigationController pushViewController:pdf animated:YES];
}

- (IBAction)changeFavorite:(id)sender {
    
    if (self.isFavorite.on  == YES) {
        [self.selectedBook addFavoriteInContext:self.context];
        
    }
    
    if (self.isFavorite.on == NO) {
        [self.selectedBook removeFavoriteInContext:self.context];
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:[FHLDetailViewController favoriteSwitchChangeKey] object:self];
    
    
}

-(void)downloadCover{
    //Se crea una cola para ejecutar la descarga
    dispatch_queue_t downloadImage = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(downloadImage, ^{
        NSURL *url = [NSURL URLWithString:self.selectedBook.photoURL];
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        
        UIImage *img = [UIImage imageWithData:imgData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            FHLPhotoEntity *photo = [FHLPhotoEntity photoWithImage:img
                                                           context:self.selectedBook.managedObjectContext];
            
            self.selectedBook.photo = photo;
            
            self.cover.image = photo.photo;
            
            [[NSNotificationCenter defaultCenter] postNotificationName:[FHLDetailViewController favoriteSwitchChangeKey] object:self];
            
            [self.cover setNeedsDisplay];
            
        });
    });

}
- (IBAction)takeNotes:(id)sender {
    
    // Fetch request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FHLAnnotation entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:FHLAnnotationAttributes.title
                             ascending:YES],
                            [NSSortDescriptor
                             sortDescriptorWithKey:FHLAnnotationAttributes.modificationDate
                             ascending:NO],
                            [NSSortDescriptor
                             sortDescriptorWithKey:FHLAnnotationAttributes.creationDate
                             ascending:NO]];
    
    req.predicate = [NSPredicate predicateWithFormat:@"book == %@", self.selectedBook];
    
    // Fetched Results Controller
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.selectedBook.managedObjectContext
                                      sectionNameKeyPath:nil
                                      cacheName:nil];
    
    // layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = CGSizeMake(140, 150);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    // View controller
    FHLNotesViewController *notes = [FHLNotesViewController coreDataCollectionViewControllerWithFetchedResultsController:fc
                                                                                                               layout:layout];
    notes.book = self.selectedBook;
    
    [self.navigationController pushViewController:notes
                                         animated:YES];
}


@end
