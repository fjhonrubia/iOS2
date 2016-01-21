#import "FHLMapSnapShot.h"
#import "FHLLocation.h"

@import CoreLocation;
@import MapKit;

@interface FHLMapSnapShot ()

// Private interface goes here.

@end

@implementation FHLMapSnapShot

-(UIImage *) image{
    
    return [UIImage imageWithData:self.snapshotData];
}

-(void) setImage:(UIImage *)image{
    self.snapshotData = UIImageJPEGRepresentation(image, 0.9);
}

+(instancetype) mapSnapshotForLocation:(FHLLocation *) location{
    
    FHLMapSnapShot *snap = [FHLMapSnapShot insertInManagedObjectContext:location.managedObjectContext];
    
    snap.location = location;
    return snap;
}

#pragma mark - Init
-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    // empezamos a observar location. cuando cambia, recalculamos el
    // snapshot
    [self startObserving];
    
    
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    // empezamos a observar location. cuando cambia, recalculamos el
    // snapshot
    [self startObserving];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self startObserving];
}

#pragma mark -  KVO
-(void) startObserving{
    [self addObserver:self
           forKeyPath:@"location"
              options:NSKeyValueObservingOptionNew
              context:NULL];
}

-(void) stopObserving{
    [self removeObserver:self
              forKeyPath:@"location"];
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    
    // Creamos el snapshot
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.location.latitudeValue, self.location.logitudeValue);
    
    MKMapSnapshotOptions *options = [MKMapSnapshotOptions new];
    options.region = MKCoordinateRegionMakeWithDistance(center, 300, 300);
    options.mapType = MKMapTypeHybrid;
    options.size = CGSizeMake(150, 150);
    
    MKMapSnapshotter *shotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    
    [shotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
        
        if (!error) {
            
            self.image = snapshot.image;
            
        }else{

            [self setPrimitiveLocation:nil];
            [self.managedObjectContext deleteObject:self];
        }
    }];
    
}
@end
