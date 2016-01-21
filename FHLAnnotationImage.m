#import "FHLAnnotationImage.h"

@interface FHLAnnotationImage ()

// Private interface goes here.

@end

@implementation FHLAnnotationImage

#pragma mark - Properties
-(void) setImg:(UIImage *)img{
    
    //Sincronizar con imageData
    self.imageData = UIImagePNGRepresentation(img);
    
}

-(UIImage *)img {
    
    return [UIImage imageWithData:self.imageData];
    
}

#pragma mark - Class Methods
+(instancetype) annotationPhotoWithImage:(UIImage *)image
                                 context:(NSManagedObjectContext *)context{
    
    FHLAnnotationImage *img = [NSEntityDescription insertNewObjectForEntityForName:[FHLAnnotationImage entityName]
                                                      inManagedObjectContext:context];
    
    img.imageData = UIImageJPEGRepresentation(image, 0.9);
    
    return img;
    
}

@end
