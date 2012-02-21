//
//  LoginViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LoginViewController;

@protocol LoginViewControllerDelegate
-(void) loginViewControllerDidFinish:(LoginViewController *)controller;
@end


@interface LoginViewController : UIViewController

@property (assign, nonatomic) IBOutlet id <LoginViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;

- (IBAction)login:(id)sender;
- (IBAction)alertFailedLogin:(id)sender;

@end
