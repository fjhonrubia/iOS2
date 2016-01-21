//
//  FHLPhotoViewController.h
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHLPhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

-(id)initWithModel:(id)model;
- (IBAction)takePicture:(id)sender;
- (IBAction)deletePhoto:(id)sender;
@end
