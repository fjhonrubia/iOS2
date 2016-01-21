#import "_FHLAnnotationImage.h"
@import UIKit;

@interface FHLAnnotationImage : _FHLAnnotationImage {}

@property (strong, nonatomic) UIImage *img;

+(instancetype) annotationPhotoWithImage:(UIImage *)image
                       context:(NSManagedObjectContext *)context;

@end
