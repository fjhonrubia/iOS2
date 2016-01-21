#import "_FHLPhotoEntity.h"
@import UIKit;

@interface FHLPhotoEntity : _FHLPhotoEntity {}

@property (strong, nonatomic) UIImage *photo;

+(instancetype) photoWithImage:(UIImage *)image
                       context:(NSManagedObjectContext *)context;

@end
