//
//  SettingsViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/24/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "SettingsViewController.h"


#import "Truck_Tracker_AppAppDelegate.h"
#import "LoginViewController.h"
#import "TrucksViewController.h"
#import "BlockPartyViewController.h"
#import "MapViewController.h"
#import "FavoritesViewController.h"
#import "UserSettingsViewController.h"
#import "TOSettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Login View


-(void)loginViewControllerDidFinish:(LoginViewController *)controller
{
    NSLog(@"Doing LoginViewControllerDidFinish");
    //    Person *selectedPerson = [Person personWithEmail:controller.usernameTextField.text password:controller.passwordTextField.text type:controller.typeTextField.text];
    
    __block Person *selectedPerson = nil;
    [((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).listUsers enumerateObjectsUsingBlock:^(id person, NSUInteger idx, BOOL *stop) {
        Person *currentPerson = (Person *)person;
        if ([currentPerson.email isEqualToString:controller.usernameTextField.text] &&
            [currentPerson.password isEqualToString:controller.passwordTextField.text]) {
            selectedPerson = currentPerson;
            *stop = YES;
        }
    }];
    
    if (selectedPerson != nil)
        
    {
        ((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson = selectedPerson;
        
        NSLog(@"User type: %@", selectedPerson.type);
        
        // Do whatever is needed upon a successful login.
        [self dismissModalViewControllerAnimated:YES];
        
    } else {
        // Display an error message, and do not dismiss the login screen.
        [controller alertFailedLogin:self];
    }
    
    Truck_Tracker_AppAppDelegate *delegate = (Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate;
    UIViewController *viewController1 = [[UINavigationController alloc]
                                         initWithRootViewController: [[TrucksViewController alloc] initWithNibName:@"TrucksView"  bundle:nil]];
    UIViewController *viewController2 = [[MapViewController alloc] initWithNibName:@"MapView" bundle:nil];
    UIViewController *viewController3 = [[BlockPartyViewController alloc] initWithNibName:@"BlockPartyView" bundle:nil];
    UIViewController *viewController4 = [[UINavigationController alloc]
                                         initWithRootViewController:[[FavoritesViewController alloc] initWithNibName:@"FavoritesView" bundle:nil]];
    UIViewController *viewController5 = [[UserSettingsViewController alloc] initWithNibName:@"UserSettingsView" bundle:nil];
    UIViewController *viewController6 = [[UINavigationController alloc] initWithRootViewController:[[TOSettingsViewController alloc] initWithNibName:@"TOSettingsView" bundle:nil]];
    
    // tab button title
    viewController1.title = @"Trucks";
    viewController2.title = @"Map";
    viewController3.title = @"Block Party";
    viewController4.title = @"Favorites";
    viewController5.title = @"Settings";
    viewController6.title = @"Settings";
    
    // tab button Images
    viewController1.tabBarItem.image = [UIImage imageNamed:@"Trucks_Icon.png"];
    viewController2.tabBarItem.image = [UIImage imageNamed:@"Map_Icon.png"];
    viewController3.tabBarItem.image = [UIImage imageNamed:@"Block_Party_Icon.png"];
    viewController4.tabBarItem.image = [UIImage imageNamed:@"Favorites_Icon.png"];
    viewController5.tabBarItem.image = [UIImage imageNamed:@"Gear Icon.png"];
    viewController6.tabBarItem.image = [UIImage imageNamed:@"Gear Icon.png"];
    
    
    if (selectedPerson.type == @"Owner"){
        delegate.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1,  viewController2, viewController3, viewController4, viewController6, nil];
        NSLog(@"Switching to owner's bar");
    }
    else{
        delegate.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2,viewController3, viewController4, viewController5,  nil];
        NSLog(@"Non-Owner's Bar");
    }
    
}

#pragma mark - Buttons

@end

