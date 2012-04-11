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
}

#pragma mark - Buttons

-(IBAction)logout:(id)sender
{
    ((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).selectedPerson = nil;
    [self displayLogin];
}

@end
