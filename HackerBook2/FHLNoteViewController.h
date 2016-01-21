//
//  FHLNoteViewController.h
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHLBook;

@interface FHLNoteViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *titleView;

@property (weak, nonatomic) IBOutlet UILabel *creationDate;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *mapSnapshot;
@property (weak, nonatomic) IBOutlet UITextView *text;

-(id) initWithModel:(id) model;
-(id) initForNewAnnotationInBook: (FHLBook *) book;

@end
