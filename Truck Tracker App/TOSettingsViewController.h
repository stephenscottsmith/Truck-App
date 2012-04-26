//
//  TOSettingsViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface TOSettingsViewController : SettingsViewController 
{
    
}

-(IBAction)editTweet:(id)sender;
-(IBAction)editCuisine:(id)sender;
-(IBAction)editMenu:(id)sender;
-(IBAction)editSchedule:(id)sender;
-(IBAction)editContactInfo:(id)sender;
-(IBAction)logout:(id)sender;

@end
