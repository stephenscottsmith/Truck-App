//
//  BlockParty.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "BlockParty.h"

@implementation BlockParty

@synthesize name, listOfTrucks, latitude, longitude, schedule;

+ (id)blockpartyWithName:(NSString *)name listOfTrucks:(NSMutableArray *)listOfTrucks latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude schedule:(NSString *)schedule
{
	BlockParty *newBlockParty = [[[self alloc] init] autorelease];
	newBlockParty.name = name;
    newBlockParty.listOfTrucks = listOfTrucks;
    newBlockParty.latitude = latitude;
    newBlockParty.longitude = longitude;
    newBlockParty.schedule = schedule;
    return newBlockParty;
}

- (void)dealloc
{
	[name release];
    [listOfTrucks release];
    [latitude release];
    [longitude release];
    [schedule release];
	[super dealloc];
}

- (CLLocationCoordinate2D)coordinate
{
    coordinate.latitude = self.latitude.doubleValue;
    coordinate.longitude = self.longitude.doubleValue;
    return coordinate;
}

@end
