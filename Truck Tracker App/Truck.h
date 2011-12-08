//
//  Trucks.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/20/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Truck : NSObject 
{

    CLLocationCoordinate2D coordinate;
    NSString *cuisine;
    NSString *name;
    NSData *menu;
    NSNumber *latitude;
    NSNumber *longitude;
    NSData *schedule;
    
}

@property (nonatomic, copy) NSString *cuisine, *name; 
@property (nonatomic, retain) NSData *menu;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSData *schedule;

+ (id)truckWithCuisine:(NSString *)cuisine name:(NSString *)name menu:(NSData *)menu latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude schedule:(NSData *) schedule;

@end
