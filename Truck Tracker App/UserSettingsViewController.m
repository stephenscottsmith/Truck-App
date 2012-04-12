//
//  UserSettingsViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/9/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "UserSettingsViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"
#import "LoginViewController.h"

#import "TruckDetailViewController.h"
#import "BlockPartyViewController.h"
#import "MapViewController.h"
#import "MapViewController.h"
#import "FavoritesViewController.h"
#import "TOSettingsViewController.h"

@interface UserSettingsViewController ()

@end

@implementation UserSettingsViewController

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

-(void)loginViewControllerDidFinish:(LoginViewController *)controller
{
//    Person *selectedPerson = [Person personWithEmail:controller.usernameTextField.text password:controller.passwordTextField.text type:controller.typeTextField.text];
  
    __block Person *selectedPerson = nil;
    [((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).listPeople enumerateObjectsUsingBlock:^(id person, NSUInteger idx, BOOL *stop) {
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
    UIViewController *viewController1 = [[TruckDetailViewController alloc] initWithNibName:@"TruckDetailView" bundle:nil];
    UIViewController *viewController2 = [[BlockPartyViewController alloc] initWithNibName:@"BlockPartyView" bundle:nil];
    UIViewController *viewController3 = [[FavoritesViewController alloc] initWithNibName:@"FavoritesView" bundle:nil];
    UIViewController *viewController4 = [[MapViewController alloc] initWithNibName:@"MapView" bundle:nil];
    UIViewController *viewController5 = [[UserSettingsViewController alloc] initWithNibName:@"UserSettingsView" bundle:nil];
    UIViewController *viewController6 = [[TOSettingsViewController alloc] initWithNibName:@"TOSettingsView" bundle:nil];
    
    ///   tab button title
    /*viewController1.title = @"Basic information";
    viewController2.title = @"Misc Quotation";
    viewController4.title = @"Quotation Line";
    viewController5.title = @"Charges";
    viewController7.title = @"Sales Part Stock";
    
    // tab button Images
    viewController1.tabBarItem.image = [UIImage imageNamed:@"general.png"];
    viewController2.tabBarItem.image = [UIImage imageNamed:@"misle.png"];
    viewController4.tabBarItem.image = [UIImage imageNamed:@"history.png"];
    viewController5.tabBarItem.image = [UIImage imageNamed:@"charges.png"];
    viewController7.tabBarItem.image = [UIImage imageNamed:@"shoebox.png"];*/

// JD: You are changing the existing tab bar controller, not creating a new one.
//    delegate.tabBarController = [[UITabBarController alloc] init];
//    delegate.tabBarController.selectedIndex = 0;
    
    if(selectedPerson.type == @"Truck Owner"){
        delegate.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1,  viewController2, viewController3, viewController4, viewController6, nil];
    }
    else{
        delegate.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2,viewController3, viewController4, viewController5,  nil];
    }
    delegate.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, viewController3, viewController4, viewController5, viewController6, nil];

// JD: No need for modal transitions here: you have just changed a tab bar controller
//     that is already in place, so there is no need to re-add it.
//    delegate.tabBarController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self.navigationController pushViewController:delegate.tabBarController animated:YES];
}

#pragma mark - Buttons

-(IBAction)logout:(id)sender
{
    ((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson = nil;
    [self displayLogin];
}

@end
