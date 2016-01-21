//
//  FHLCollectionViewCell.h
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHLCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDate;
@property (weak, nonatomic) IBOutlet UILabel *title;

+(NSString *)cellId;

@end
