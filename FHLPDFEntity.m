#import "FHLPDFEntity.h"

@interface FHLPDFEntity ()

// Private interface goes here.

@end

@implementation FHLPDFEntity

#pragma mark - Class Methods
+(instancetype) pdfWithData:(NSData *)data
                    context:(NSManagedObjectContext *)context{
    
    FHLPDFEntity *pdf = [NSEntityDescription insertNewObjectForEntityForName:[FHLPDFEntity entityName]
                                                      inManagedObjectContext:context];
    
    pdf.pdfData = data;
    
    return pdf;
    
}

@end
