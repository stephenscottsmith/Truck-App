//
//  Person.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize email, password, type, userFavoritesList;


+ (id)personWithEmail:(NSString *)email password:(NSString *)password type:(NSString *)type userFavoritesList:(NSMutableArray *)userFavoritesList
{
	Person *newPerson = [[[self alloc] init] autorelease];
	newPerson.email = email;
	newPerson.password = password;
    newPerson.type = type;
    newPerson.userFavoritesList = userFavoritesList;
    return newPerson;
}

- (void)dealloc
{
	[email release];
	[password release];
    [type release];
    [userFavoritesList release];
	[super dealloc];
}

- (BOOL)isEqual:(id)anObject {
    // We will say that two Persons are equal if they have the same password and email.
    Person *otherPerson = (Person *)anObject;
    return [email isEqual: otherPerson.email] && [password isEqual: otherPerson.password] && [type isEqual: otherPerson.type] && [userFavoritesList isEqual:otherPerson.userFavoritesList];
}

@end
