//
//  FHLMasterViewController.m
//  HackerBook2
//
//  Created by Fco. Javier Honrubia Lopez on 13/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "FHLMasterViewController.h"
#import "FHLDetailViewController.h"
#import "FHLBookCellView.h"
#import "FHLBook.h"
#import "FHLAuthor.h"
#import "FHLPhotoEntity.h"
#import "FHLTag.h"
#import "Config.h"

@interface FHLMasterViewController () < UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic) BOOL isSearching;
@property (strong, nonatomic) UISearchController *sc;
@end

@implementation FHLMasterViewController

#pragma mark - View LifeCycle
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Se le da un título
    self.title = @"Librería";
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateChanges)
                                                 name:[FHLDetailViewController favoriteSwitchChangeKey]
                                               object:nil];
    
    //Se registra la celda
    UINib *nib = [UINib nibWithNibName:@"FHLBookCellView" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:[FHLBookCellView cellId]];
    
    //creación y configuración del searchController
    self.sc = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.sc.searchResultsUpdater = self;
    self.sc.dimsBackgroundDuringPresentation = false;
    self.definesPresentationContext = true;
    self.tableView.tableHeaderView = self.sc.searchBar;
    self.sc.searchBar.scopeButtonTitles = @[@"Título", @"Tag", @"Autor"];
    self.sc.searchBar.delegate = self;
    [self.sc.searchBar sizeToFit];

    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark - DataSource
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FHLBook *book = [self bookAtIndexPath:indexPath];

    //crear una celda
    FHLBookCellView *cell = [tableView dequeueReusableCellWithIdentifier:[FHLBookCellView cellId]];
    
    //configurar la celda en función del libro seleccionado
    cell.title.text = book.title;
    cell.authors.text = [book.obtainAuthors componentsJoinedByString:@","];
    
    if (book.photo.photo != nil) {
        cell.image.image = book.photo.photo;
    } else {
        UIImage *imageBook = [UIImage imageNamed:@"book_PNG2111.png"];
        cell.image.image = imageBook;
    }
    
    //devolver la celda
    return cell;
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //En función de si se está en una búsqueda, se retornan o los números de libros que contiene un tag
    //o el número de objetos que contiene el fetchedResultsController (resultados de la búsqueda)
    if (self.isSearching == YES) {
        return self.fetchedResultsController.fetchedObjects.count;
    } else {
        return [[[self.fetchedResultsController.fetchedObjects objectAtIndex:section] books] count];
    }
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //Se elimina la barra de índice de búsqueda
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //Se cambia el header de la sección en función de si se trata de un resultado de una búsqueda
    //o de los nombres de los tags
    if (self.isSearching == YES) {
        return @"Resultados Búsqueda";
    } else {
        NSString *sectionName = [[[self.fetchedResultsController sections] objectAtIndex:section] name];
        return [sectionName substringFromIndex:1];
    }

}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    //En función de si se está en una búsqueda habrá una única sección
    //o bien tantas secciones como tags se hayan encontrado
    if (self.isSearching == YES) {
        return 1;
    } else {
        return [super numberOfSectionsInTableView:tableView];
    }
}

#pragma mark - Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    //Rellenar con los datos del libro seleccionado
    FHLBook *book = [self bookAtIndexPath:indexPath];
    
    //Se guarda su identificador en local
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:book.archiveURIRepresentation forKey:BOOK_SELECTED_KEY];
    [defaults synchronize];
    
    //Se guarda el identificador en la nube
    //NSUbiquitousKeyValueStore *ubiStore = [NSUbiquitousKeyValueStore defaultStore];
    //[ubiStore setObject:book.archiveURIRepresentation forKey:BOOK_SELECTED_KEY];
    //[ubiStore synchronize];
    
    //Se crea en controlador de detalle y se muestra
    FHLDetailViewController *detailVC = [[FHLDetailViewController alloc] initWithBook:book context:self.fetchedResultsController.managedObjectContext];
    [detailVC downloadCover];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:detailVC];
    
    [self.splitViewController showDetailViewController:nc sender:self];
}

#pragma mark - Utils
- (FHLBook *) bookAtIndexPath:(NSIndexPath *) indexPath{
    
    if (self.isSearching == YES) {
        if (self.fetchedResultsController.fetchedObjects.count == 0 ) {
            return 0;
        } else {
            return [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];
        }
    } else {
        FHLTag *tag = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.section];
        FHLBook *book = [[tag.books allObjects] objectAtIndex:indexPath.row];
        return book;
    }
    
}

-(void)updateChanges{
    
    [self.tableView reloadData];
    
}

#pragma mark - UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    NSFetchedResultsController *results = nil;
    NSPredicate *pred = nil;
    
    if (searchController.searchBar.text.length != 0) {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FHLBook entityName]];
        
        //Búsqueda por título
        if (searchController.searchBar.selectedScopeButtonIndex == 0) {
            pred = [NSPredicate predicateWithFormat:@"title BEGINSWITH[c] %@", searchController.searchBar.text];
        }
        
        //Búsqueda por Tag
        if (searchController.searchBar.selectedScopeButtonIndex == 1) {
            pred = [NSPredicate predicateWithFormat:@"tags.name CONTAINS[c] %@", searchController.searchBar.text];
        }
        //Búsqueda por Autor
        if (searchController.searchBar.selectedScopeButtonIndex == 2) {
            pred = [NSPredicate predicateWithFormat:@"authors.name CONTAINS[c] %@", searchController.searchBar.text];
        }
        
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:FHLBookAttributes.title
                                                              ascending:YES selector:@selector(caseInsensitiveCompare:)]];
        req.predicate = pred;
        
        results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                      managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                        sectionNameKeyPath:nil
                                                                 cacheName:nil];
        self.isSearching = YES;
        
        
    } else {
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FHLTag entityName]];
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:FHLTagAttributes.name
                                                              ascending:YES selector:@selector(caseInsensitiveCompare:)]];
        
        results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                      managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                        sectionNameKeyPath:FHLTagAttributes.name
                                                                 cacheName:nil];
        self.isSearching = NO;
        
    }
    
    self.fetchedResultsController = results;
    
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    [self updateChanges];

}
@end
