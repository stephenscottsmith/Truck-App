//
//  MapViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/15/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Truck.h"

@interface MapViewController : UIViewController
{
    CLLocationCoordinate2D coordinate;
    MKMapView *mapView;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;


@end