//
//  LoginViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewUserController.h"
#import "ForgotPasswordViewController.h"


@class LoginViewController;

@protocol LoginViewControllerDelegate
-(void) loginViewControllerDidFinish:(LoginViewController *)controller;
@end


@interface LoginViewController : UIViewController <NewUserControllerDelegate, ForgotPasswordViewControllerDelegate>
{
    
}

@property (assign, nonatomic) IBOutlet id <LoginViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;

- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)alertFailedLogin:(id)sender;
- (IBAction)newUser:(id)sender;
- (IBAction)forgotPassword:(id)sender;

@end
