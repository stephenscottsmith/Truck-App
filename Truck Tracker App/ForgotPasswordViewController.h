//
//  ForgotPasswordViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 3/29/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForgotPasswordViewController;

@protocol ForgotPasswordViewControllerDelegate
-(void) forgotPasswordViewControllerDidFinish:(ForgotPasswordViewController *)controller;
@end

@interface ForgotPasswordViewController : UIViewController

@property (assign, nonatomic) IBOutlet id <ForgotPasswordViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *emailTextField;

-(IBAction)sendEmail:(id)sender;

@end
