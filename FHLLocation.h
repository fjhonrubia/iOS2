#import "_FHLLocation.h"

@class FHLAnnotation;

@import CoreLocation;
@import MapKit;

@interface FHLLocation : _FHLLocation <MKAnnotation> {}

+(instancetype) locationWithCLLocation:(CLLocation*)location forAnnotation:(FHLAnnotation *) note;

@end
