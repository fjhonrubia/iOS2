#import "_FHLAuthor.h"

@interface FHLAuthor : _FHLAuthor {}

+(instancetype) authorWithString:(NSString *)author
                          context:(NSManagedObjectContext *)context;

@end
