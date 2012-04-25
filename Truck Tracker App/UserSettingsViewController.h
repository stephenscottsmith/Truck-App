//
//  UserSettingsViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface UserSettingsViewController : SettingsViewController 
{
    UINavigationController *navigationController;
    UIWindow *window;   
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic,retain) IBOutlet UINavigationController *navigationController;

-(IBAction)logout:(id)sender;

@end
