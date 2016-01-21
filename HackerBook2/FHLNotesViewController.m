//
//  FHLNotesViewController.m
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "FHLNotesViewController.h"
#import "FHLNoteViewController.h"
#import "FHLCollectionViewCell.h"
#import "FHLAnnotation.h"
#import "FHLAnnotationImage.h"
#import "FHLBook.h"

@interface FHLNotesViewController ()

@end

@implementation FHLNotesViewController


#pragma mark -  View Lifecicle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Se registra el nib de los items de la collection view
    UINib *nib = [UINib nibWithNibName:@"FHLCollectionViewCell" bundle:nil];
    
    //Se registra el nib
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:[FHLCollectionViewCell cellId]];
    
    self.title = @"Anotaciones";
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNote:)];
    self.navigationItem.rightBarButtonItem = add;
    
}

#pragma mark - Data Source
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //obtener el objeto
    FHLAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //obtener una celda
    FHLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FHLCollectionViewCell cellId]
                                                                      forIndexPath:indexPath];
    
    //configurar la celda
    cell.title.text = note.title;
    cell.photoView.image = note.image.img;
    
    //se formatea la fecha
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    cell.modificationDate.text = [fmt stringFromDate:note.modificationDate];
    
    //devolverla
    return cell;
}

#pragma mark - Utils
-(void) addNote:(id) sender{
    
    FHLNoteViewController *newNoteVC = [[FHLNoteViewController alloc] initForNewAnnotationInBook:self.book];
    [self.navigationController pushViewController:newNoteVC
                                         animated:YES];
    
}

#pragma mark -  Delegate
-(void) collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    // Obtener el objeto
    FHLAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];

    // Crear el controlador
    FHLNoteViewController *noteVC = [[FHLNoteViewController alloc] initWithModel:note];

    // Hacer un push
    [self.navigationController pushViewController:noteVC
                                         animated:YES];

}

@end
