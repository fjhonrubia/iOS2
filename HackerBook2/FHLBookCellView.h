//
//  FHLBookCellView.h
//  HackerBook2
//
//  Created by Fco. Javier Honrubia Lopez on 14/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHLBookCellView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *authors;

+(NSString *)cellId;

@end
