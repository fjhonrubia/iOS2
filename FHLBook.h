#import "_FHLBook.h"

@interface FHLBook : _FHLBook {}

+(instancetype) bookWithTitle:(NSString *)title
                       pdfURL:(NSString *)pdfURL
                     photoURL:(NSString *)photoURL
                      authors:(NSArray *)authors
                         tags:(NSArray *)tags
                      context:(NSManagedObjectContext *)context;

+(instancetype) objectWithArchivedURIRepresentation:(NSData *)archivedURI
                                            context:(NSManagedObjectContext *)context;

-(NSArray *)obtainAuthors;
-(NSArray *)obtainTags;

-(void)addFavoriteInContext:(NSManagedObjectContext *)context;
-(void)removeFavoriteInContext:(NSManagedObjectContext *)context;
-(NSData *)archiveURIRepresentation;

@end
