//
//  FHLNotesViewController.h
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "AGTCoreDataCollectionViewController.h"
@class FHLBook;

@interface FHLNotesViewController : AGTCoreDataCollectionViewController

@property (strong, nonatomic) FHLBook *book;

@end
