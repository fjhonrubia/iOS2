#import "FHLAuthor.h"

@interface FHLAuthor ()

// Private interface goes here.

@end

@implementation FHLAuthor

#pragma mark - Class Methods
+(instancetype) authorWithString:(NSString *)author
                         context:(NSManagedObjectContext *)context {
    
    FHLAuthor *auth = nil;
    
    //Se comprueba si ya existe el autor
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FHLAuthor entityName]];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name == %@", author];
    req.predicate = pred;
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:req
                                              error:&error];
    
    if (error) {
        NSLog(@"Error al recuperar el autor");
        return nil;
    }
    
    //Si no existe, se crea el autor
    if (results.count == 0) {
        auth = [NSEntityDescription insertNewObjectForEntityForName:[FHLAuthor entityName]
                                             inManagedObjectContext:context];
        auth.name = author;
    } else {
        //Si ya existe, se recupera y se retorna
        auth = (FHLAuthor *)results[0];
    }
    
    return auth;
}

@end
