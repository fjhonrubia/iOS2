#import "FHLAnnotation.h"
#import "FHLLocation.h"
@import CoreLocation;

@interface FHLAnnotation () <CLLocationManagerDelegate>
// Private interface goes here.

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation FHLAnnotation
@synthesize locationManager=_locationManager;

-(BOOL)hasLocation{
    return (nil != self.location);
}

#pragma mark - Class Methods
+(instancetype) annotationWithTitle:(NSString *)title
                               book:(FHLBook *)book
                            context:(NSManagedObjectContext *)context {
    
    FHLAnnotation *annotation = [NSEntityDescription insertNewObjectForEntityForName:[FHLAnnotation entityName]
                                                              inManagedObjectContext:context];
    
    annotation.title = title;
    annotation.creationDate = [NSDate date];
    annotation.modificationDate = [NSDate date];
    annotation.book = book;
    
    return annotation;
    
}

#pragma mark - Init
-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (((status == kCLAuthorizationStatusAuthorizedAlways) || (status == kCLAuthorizationStatusNotDetermined) || (status == kCLAuthorizationStatusAuthorizedWhenInUse))
        && [CLLocationManager locationServicesEnabled]) {
        
        // Tenemos acceso a localización
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        self.locationManager.distanceFilter=kCLDistanceFilterNone;
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startMonitoringSignificantLocationChanges];
        [self.locationManager setPausesLocationUpdatesAutomatically:NO];
        [self.locationManager startUpdatingLocation];
        
        //Se para el locationManager
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self zapLocationManager];
        });
    }
    
}

#pragma mark - CLLocationManagerDelegate
-(void) locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    
    // paramos el location manager, que consume mucha bateria
    [self zapLocationManager];
    
    
    
    if (self.location == nil) {
        // Pillamos la última
        CLLocation *loc = [locations lastObject];
        
        // Creamos una AGTLocation
        self.location = [FHLLocation locationWithCLLocation:loc
                                                    forAnnotation:self];
    }else{
        NSLog(@"No deberíamos llegar aquí jamás");
    }
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"Fallo en el location");
}



#pragma mark - Utils
-(void)zapLocationManager{
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    self.locationManager = nil;
}

@end
