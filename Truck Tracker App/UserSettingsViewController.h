//
//  UserSettingsViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface UserSettingsViewController : UIViewController <LoginViewControllerDelegate>
{
    
}

-(IBAction)logout:(id)sender;

@end
