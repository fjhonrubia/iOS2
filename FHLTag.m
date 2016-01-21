#import "FHLTag.h"

@interface FHLTag ()

// Private interface goes here.

@end

@implementation FHLTag

#pragma mark - Class Methods
+(instancetype) tagWithString:(NSString *)tag
                      context:(NSManagedObjectContext *)context {
    
    FHLTag *t = nil;
    
    //Se elimina el caracter en blanco del principio del String
    if ([tag hasPrefix:@" "]) {
        tag = [tag substringFromIndex:1];
    }
    
    if ([tag isEqualToString:@"FAVORITOS"]) {
        tag = [@"A" stringByAppendingString:tag];
    } else {
        tag = [@"Z" stringByAppendingString:tag];
    }
    
    //Se comprueba si ya existe el tag
    NSArray *results = [FHLTag obtainTagByName:tag
                                       context:context];
    
    //Si no existe, se crea el tag
    if (results.count == 0) {
        t = [NSEntityDescription insertNewObjectForEntityForName:[FHLTag entityName]
                                             inManagedObjectContext:context];
        t.name = tag;
    } else {
        //Si ya existe, se recupera y se retorna
        t = (FHLTag *)results[0];
    }
    
    return t;
}

+(NSArray *)obtainTagByName:(NSString *)name context:(NSManagedObjectContext *)context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[FHLTag entityName]];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name == %@", name];
    req.predicate = pred;
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:req
                                              error:&error];
    
    if (error){
        NSLog(@"Error al recuperar el tag");
        return nil;
    } else {
        return results;
    }
    
}

@end
