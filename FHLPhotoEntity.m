#import "FHLPhotoEntity.h"
#import "FHLBook.h"

@interface FHLPhotoEntity ()

// Private interface goes here.

@end

@implementation FHLPhotoEntity

#pragma mark - Properties
-(void)setPhoto:(UIImage *)photo {
    
    //Sincronizar con photoData
    self.photoData = UIImagePNGRepresentation(photo);
    
}

-(UIImage *) photo{
    
    return [UIImage imageWithData:self.photoData];
    
}

#pragma mark - Class Methods
+(instancetype) photoWithImage:(UIImage *)image
                       context:(NSManagedObjectContext *)context{
    
    FHLPhotoEntity *p = [NSEntityDescription insertNewObjectForEntityForName:[FHLPhotoEntity entityName]
                                                inManagedObjectContext:context];
    
    p.photoData = UIImageJPEGRepresentation(image, 0.9);
    
    return p;
    
}

@end
