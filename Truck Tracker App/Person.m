//
//  Person.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize email, password;


+ (id)personWithEmail:(NSString *)email password:(NSString *)password 
{
	Person *newPerson = [[[self alloc] init] autorelease];
	newPerson.email = email;
	newPerson.password = password;
    return newPerson;
}

- (void)dealloc
{
	[email release];
	[password release];
	[super dealloc];
}

@end
