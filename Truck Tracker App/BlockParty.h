//
//  BlockParty.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockParty : NSObject
{
    NSString *name;
}

@property (nonatomic, copy) NSString *name;

+ (id)blockpartyWithName:(NSString *)name;

@end
