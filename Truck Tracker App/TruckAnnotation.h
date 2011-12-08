//
//  TruckAnnotation.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 12/6/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "Truck.h"

@interface TruckAnnotation : NSObject <MKAnnotation>
{
    Truck *truck;
}

@property (nonatomic, retain) Truck *truck;

+ (id)withTruck:(Truck *)truck;


@end