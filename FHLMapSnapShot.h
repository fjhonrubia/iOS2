#import "_FHLMapSnapShot.h"
@class FHLLocation;
@import UIKit;

@interface FHLMapSnapShot : _FHLMapSnapShot {}

@property (nonatomic, strong) UIImage *image;

+(instancetype) mapSnapshotForLocation:(FHLLocation*) location;

@end
