//
//  FHLLocationViewController.m
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "FHLLocationViewController.h"
#import "FHLLocation.h"

@interface FHLLocationViewController ()
@property (nonatomic, strong) FHLLocation *model;
@end

@implementation FHLLocationViewController

-(id)initWithLocation:(FHLLocation *)location{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = location;
    }
    return self;
}

- (IBAction)standardMap:(id)sender {
    self.mapView.mapType = MKMapTypeStandard;
}

- (IBAction)satelliteMap:(id)sender {
    self.mapView.mapType = MKMapTypeSatellite;
}

- (IBAction)HybridMap:(id)sender {
    self.mapView.mapType = MKMapTypeHybrid;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Lo añadimos a la mapview
    [self.mapView addAnnotation:self.model];
    
    MKCoordinateRegion big = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 2000000, 2000000);
    [self.mapView setRegion:big];
    
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // cambiamos la región con animación
    MKCoordinateRegion small = MKCoordinateRegionMakeWithDistance(self.model.coordinate, 500, 500);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.mapView setRegion:small animated:YES];
    });
}
@end
