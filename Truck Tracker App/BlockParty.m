//
//  BlockParty.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "BlockParty.h"

@implementation BlockParty

@synthesize name;

+ (id)blockpartyWithName:(NSString *)name 
{
	BlockParty *newBlockParty = [[[self alloc] init] autorelease];
	newBlockParty.name = name;
    return newBlockParty;
}

- (void)dealloc
{
	[name release];
	[super dealloc];
}

@end
