//
//  UserSettingsViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "UserSettingsViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"


@interface UserSettingsViewController ()

@end

@implementation UserSettingsViewController

@synthesize navigationController, window;

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
     if (((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson == nil) {
     [self displayLogin];
     }
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

#pragma mark - Login View

-(void)displayLogin
{
    LoginViewController *controller = [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    
}

#pragma mark - Buttons

-(IBAction)logout:(id)sender
{
    ((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson = nil;
    [self displayLogin];
}

@end
