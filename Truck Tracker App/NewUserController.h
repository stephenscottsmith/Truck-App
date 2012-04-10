//
//  NewUserController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 3/29/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewUserController;

@protocol NewUserControllerDelegate
-(void) newUserControllerDidFinish:(NewUserController *)controller;
@end

@interface NewUserController : UIViewController

@property (assign, nonatomic) IBOutlet id <NewUserControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;


-(IBAction)addPerson:(id)sender;
-(IBAction)alertNeedNewUserName:(id)sender;

@end
