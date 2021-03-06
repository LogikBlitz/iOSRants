//
//  WARMapViewController.m
//  WhatsAround
//
//  Created by Thomas Blitz on 04/06/13.
//  Copyright (c) 2013 PenguinSoft. All rights reserved.
//

#import "WARMapViewController.h"
#import "FSQFoursquareAPIClient.h"
#import "SVProgressHUD.h"
#import "WARVenueAnnotation.h"

@interface WARMapViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSArray *venues;

@end
@implementation WARMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self updateLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    self.locationManager = nil;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager){
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (void)updateLocation{
    [self.locationManager startUpdatingLocation];
}

- (void)fetchVenuesForLocation:(CLLocation *)location{
    [SVProgressHUD show];
    
    [[FSQFoursquareAPIClient sharedClient] fetchVenuesNear:location.coordinate
                                                searchTerm:@"coffee"
                                            radiusInMeters:4000
                                                completion:^(NSArray *venues, NSError *error) {
                                                    if (error){
                                                        [SVProgressHUD showErrorWithStatus:@":("];
                                                    }else{
                                                        [SVProgressHUD dismiss];
                                                        self.venues = venues;
                                                        [self updateAnnotations];
                                                    }
                                                }];
}

- (void)updateAnnotations{
    for (FSQVenue *venue in self.venues) {
        WARVenueAnnotation *annotation = [[WARVenueAnnotation alloc]initWithVenue:venue];
        [self.mapView addAnnotation:annotation];
    }
}

- (void)zoomToLocation:(CLLocation *)location inRadius:(CGFloat)radius{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, radius * 2, radius * 2);
    [self.mapView setRegion:region animated:YES];
    
}


#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations lastObject];
    [self fetchVenuesForLocation:location];
    [self zoomToLocation:location inRadius:2000];
    
    [self.locationManager stopUpdatingLocation];
}

@end
