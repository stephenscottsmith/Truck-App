//
//  BlockParty.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BlockParty : NSObject
{
    CLLocationCoordinate2D coordinate;
    NSString *name;
    NSMutableArray *listOfTrucks;
    NSNumber *latitude;
    NSNumber *longitude;
    NSString *schedule;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSMutableArray *listOfTrucks;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *schedule;


+ (id)blockpartyWithName:(NSString *)name listOfTrucks:(NSMutableArray *)listOfTrucks latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude schedule:(NSString *) schedule;

@end
