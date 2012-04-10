//
//  NewUserController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 3/29/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "NewUserController.h"
#import "Truck_Tracker_AppAppDelegate.h"

@implementation NewUserController

@synthesize delegate = _delegate;
@synthesize usernameTextField = _usernameTextField, passwordTextField = _passwordTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Add Person
- (IBAction)alertNeedNewUserName:(id)sender
{
    UIAlertView *alertView = (UIAlertView *)[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Someone already has that username. Please enter another."delegate: nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alertView show];
}

-(IBAction)addPerson:(id)sender
{
    [self.delegate newUserControllerDidFinish:self];
}

@end
