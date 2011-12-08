//
//  TruckAnnotation.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 12/6/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "TruckAnnotation.h"

@implementation TruckAnnotation

@synthesize truck;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (id)withTruck:(Truck *)truck
{
	TruckAnnotation *newTruckAnnotation = [[[self alloc] init] autorelease];
    newTruckAnnotation.truck = truck;
	return newTruckAnnotation;
}

// This part fulfills the MKAnnotation requirement.
- (CLLocationCoordinate2D)coordinate;
{
    return truck.coordinate;
}

// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
- (NSString *)title
{
    return truck.name;
}

// optional
- (NSString *)subtitle
{
    return truck.cuisine;
}

@end
