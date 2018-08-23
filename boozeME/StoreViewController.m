//
//  StoreViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-23.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "StoreViewController.h"
#import "Stores.h"
#import "NetworkManager.h"
@import MapKit;
@import CoreLocation;


@interface StoreViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSArray<Stores*> *objects;

@end

@implementation StoreViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  [self.locationManager requestWhenInUseAuthorization];
  
  [self.locationManager requestLocation];
  [self.locationManager startUpdatingLocation];
  
  [self.mapView setShowsUserLocation:YES];
  
  [NetworkManager getStores:^(NSArray *stores) {
    self.objects = stores;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      
      [self.mapView showAnnotations:self.objects animated:YES];
    }];
  }];
  
  
  
  
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  NSLog(@"Moved to %@", locations[0]);
  
  MKCoordinateRegion currentRegion = MKCoordinateRegionMake(locations[0].coordinate, MKCoordinateSpanMake(0.02, 0.02));
  [self.mapView setRegion:currentRegion animated:YES];
  
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  NSLog(@"did fail with error: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
  NSLog(@"Authorization status changed: %d", status);
}




@end
