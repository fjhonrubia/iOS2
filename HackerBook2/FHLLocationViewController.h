//
//  FHLLocationViewController.h
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHLLocation;
@import MapKit;

@interface FHLLocationViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(id)initWithLocation:(FHLLocation *)location;

- (IBAction)standardMap:(id)sender;
- (IBAction)satelliteMap:(id)sender;
- (IBAction)HybridMap:(id)sender;



@end
