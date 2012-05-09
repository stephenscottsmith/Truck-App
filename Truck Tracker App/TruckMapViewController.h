//
//  TruckMapViewController.h
//  Truck Tracker App
//
//  Created by Scott Smith on 11/10/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface TruckMapViewController : UIViewController
{
    CLLocationCoordinate2D coordinate;
    MKMapView *mapView;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

