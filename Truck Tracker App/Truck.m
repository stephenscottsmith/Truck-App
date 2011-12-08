//
//  Trucks.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/20/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "Truck.h"

@implementation Truck

@synthesize cuisine, name, menu, latitude, longitude, schedule;


+ (id)truckWithCuisine:(NSString *)cuisine name:(NSString *)name menu:(NSData *)menu 
              latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude schedule:(NSData *)schedule
{
	Truck *newTruck = [[[self alloc] init] autorelease];
	newTruck.cuisine = cuisine;
	newTruck.name = name;
    newTruck.menu = menu;
    newTruck.latitude = latitude;
    newTruck.longitude = longitude;
    newTruck.schedule = schedule;
	return newTruck;
}


- (void)dealloc
{
	[cuisine release];
	[name release];
    [menu release];
    [latitude release];
    [longitude release];
    [schedule release];
	[super dealloc];
}

// Implementing this method ensures the Key-Value observers will be notified when the properties
// from which coordinate is derived have changed.
//
/*
+ (NSSet *)keyPathsForValuesAffectingCoordinate
{
    return [NSSet setWithObjects:@"latitude", @"longitude", nil];
}
*/

// derive the coordinate property.
- (CLLocationCoordinate2D)coordinate
{
    coordinate.latitude = self.latitude.doubleValue;
    coordinate.longitude = self.longitude.doubleValue;
    return coordinate;
}

@end
