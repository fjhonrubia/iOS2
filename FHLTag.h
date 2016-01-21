#import "_FHLTag.h"

@interface FHLTag : _FHLTag {}

+(instancetype) tagWithString:(NSString *)tag
                       context:(NSManagedObjectContext *)context;

+(NSArray *)obtainTagByName:(NSString *)name context:(NSManagedObjectContext *)context;

@end
