//
//  TOSettingsViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "TOSettingsViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"

#import "EditTweetViewController.h"
#import "TOEditCuisineViewController.h"
#import "EditMenuViewController.h"
#import "EditScheduleViewController.h"
#import "EditContactInfoViewController.h"

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

-(IBAction)editTweet:(id)sender
{
    EditTweetViewController *detailsViewController = [[EditTweetViewController alloc] initWithNibName:@"EditTweetView" bundle:nil];
    
    
    detailsViewController.title = @"Edit Tweet";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)editCuisine:(id)sender
{
    TOEditCuisineViewController *detailsViewController = [[TOEditCuisineViewController alloc] initWithNibName:@"TOEditCuisineView" bundle:nil];
        
        
    detailsViewController.title = @"Edit Cuisine";
        
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)editMenu:(id)sender
{
    EditMenuViewController *detailsViewController = [[EditMenuViewController alloc] initWithNibName:@"EditMenuView" bundle:nil];
    
    
    detailsViewController.title = @"Edit Menu";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)editSchedule:(id)sender
{
    EditScheduleViewController *detailsViewController = [[EditScheduleViewController alloc] initWithNibName:@"EditScheduleView" bundle:nil];
    
    
    detailsViewController.title = @"Edit Schedule";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)editContactInfo:(id)sender
{
    EditContactInfoViewController *detailsViewController = [[EditContactInfoViewController alloc] initWithNibName:@"EditContactInfoView" bundle:nil];
    
    
    detailsViewController.title = @"Edit Contact Info";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)logout:(id)sender
{
    ((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson = nil;
    [self displayLogin];
}

@end
