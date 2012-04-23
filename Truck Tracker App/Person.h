//
//  Person.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *email;
    NSString *password;
    NSString *type;
    NSMutableArray *userFavoritesList;
    
}

@property (nonatomic, copy) NSString *email, *password, *type; 
@property (nonatomic, copy) NSMutableArray *userFavoritesList;

+ (id)personWithEmail:(NSString *)email password:(NSString *)password type:(NSString *)type userFavoritesList:(NSMutableArray *)userFavoritesList;

@end
