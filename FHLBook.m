#import "FHLBook.h"
#import "FHLAuthor.h"
#import "FHLTag.h"

@interface FHLBook ()

// Private interface goes here.

@end

@implementation FHLBook

#pragma mark - Class Methods

+(instancetype) bookWithTitle:(NSString *)title
                       pdfURL:(NSString *)pdfURL
                     photoURL:(NSString *)photoURL
                      authors:(NSArray *)authors
                         tags:(NSArray *)tags
                      context:(NSManagedObjectContext *)context {

    FHLBook *book = [NSEntityDescription insertNewObjectForEntityForName:[FHLBook entityName]
                                                  inManagedObjectContext:context];
    
    book.title = title;
    book.pdfURL = pdfURL;
    book.photoURL = photoURL;
    
    
    //Se agregan los tags y los autores al libro. De la inversa ya se encarga CoreData
    for (NSString *author in authors) {
        FHLAuthor *auth = [FHLAuthor authorWithString:author context:context];
        [book addAuthorsObject:auth];
    }
    
    for (NSString *tag in tags) {
        FHLTag *t = [FHLTag tagWithString:tag context:context];
        [book addTagsObject:t];
    }
    
    return book;
    
}

+(instancetype) objectWithArchivedURIRepresentation:(NSData *)archivedURI
                                            context:(NSManagedObjectContext *)context {
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    NSManagedObjectID *nid = [context.persistentStoreCoordinator managedObjectIDForURIRepresentation:uri];
    
    if (nid == nil) {
        return nil;
    }
    
    NSManagedObject *obj = [context objectWithID:nid];
    if (obj.isFault) {
        return (FHLBook *)obj;
    } else {
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:obj.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", obj];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        
        if (res == nil) {
            return nil;
        } else {
            return res.lastObject;
        }
    }
    
}
#pragma mark - Utils
-(NSArray *)obtainAuthors{
    
    NSMutableArray *authorsArray = [NSMutableArray new];
    
    for (FHLAuthor *detail in self.authors) {
        [authorsArray addObject:detail.name];
    }
    
    return authorsArray;
    
}
-(NSArray *)obtainTags{
    
    NSMutableArray *tagsArray = [NSMutableArray new];
    
    for (FHLTag *detail in self.tags) {
        [tagsArray addObject:detail.name];
    }
    
    return tagsArray;
    
}
-(void)addFavoriteInContext:(NSManagedObjectContext *)context{
    
    //Se crea el Tag de favoritos
    FHLTag *tag = [FHLTag tagWithString:@"FAVORITOS" context:self.managedObjectContext];
    
    //Se agrega el libro al tag de favoritos
    [self addTagsObject:tag];
    self.isFavoriteValue = YES;
    
}

-(void)removeFavoriteInContext:(NSManagedObjectContext *)context{
    
    //Se elimina el libro del tag de favoritos
    NSArray *results = [FHLTag obtainTagByName:@"AFAVORITOS" context:self.managedObjectContext];
    FHLTag *favorite = (FHLTag *)results[0];
    [self removeTagsObject:favorite];
    if (favorite.books.count == 0) {
        [self.managedObjectContext deleteObject:favorite];
    }
    self.isFavoriteValue = NO;
    
}

-(NSData *)archiveURIRepresentation{
    
    NSURL *uri = self.objectID.URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
    
}
@end
