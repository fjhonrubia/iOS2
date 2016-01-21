#import "_FHLPDFEntity.h"

@interface FHLPDFEntity : _FHLPDFEntity {}

+(instancetype) pdfWithData:(NSData *)data
                    context:(NSManagedObjectContext *)context;
@end
