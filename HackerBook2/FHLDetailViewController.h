//
//  FHLDetailViewController.h
//  HackerBook2
//
//  Created by Fco. Javier Honrubia Lopez on 13/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHLBook;

@interface FHLDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleBook;
@property (weak, nonatomic) IBOutlet UIImageView *cover;
@property (weak, nonatomic) IBOutlet UILabel *authors;
@property (weak, nonatomic) IBOutlet UILabel *tags;
@property (weak, nonatomic) IBOutlet UISwitch *isFavorite;


+ (NSString *)favoriteSwitchChangeKey;
- (id) initWithBook:(FHLBook *) book context:(NSManagedObjectContext *)context;
- (IBAction)obtainPDF:(id)sender;
- (IBAction)changeFavorite:(id)sender;
- (IBAction)takeNotes:(id)sender;

-(void)downloadCover;

@end
