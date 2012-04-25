//
//  TOSettingsViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "TOSettingsViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"

#import "TrucksViewController.h"
#import "BlockPartyViewController.h"
#import "MapViewController.h"
#import "MapViewController.h"
#import "FavoritesViewController.h"
#import "UserSettingsViewController.h"

#import "TOEditCuisineViewController.h"

@interface TOSettingsViewController ()

@end

@implementation TOSettingsViewController

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

#pragma mark - Login View

-(void)displayLogin
{
    LoginViewController *controller = [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    
}

#pragma mark - Buttons

-(IBAction)displayEditCuisine:(id)sender
{
    TOEditCuisineViewController *detailsViewController = [[TOEditCuisineViewController alloc] initWithNibName:@"TOEditCuisineView" bundle:nil];
        
        
    detailsViewController.title = @"Edit Cuisine";
        
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)logout:(id)sender
{
    ((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson = nil;
    [self displayLogin];
}

@end
