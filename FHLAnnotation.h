#import "_FHLAnnotation.h"

@interface FHLAnnotation : _FHLAnnotation {}

@property (nonatomic, readonly) BOOL hasLocation;

+(instancetype) annotationWithTitle:(NSString *)title
                               book:(FHLBook *)book
                            context:(NSManagedObjectContext *)context;

@end
