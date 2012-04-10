//
//  LoginViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "LoginViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"

@implementation LoginViewController

@synthesize delegate = _delegate;
@synthesize usernameTextField = _usernameTextField;
@synthesize passwordTextField = _passwordTextField;
@synthesize typeTextField = _typeTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

-(IBAction)dismissKeyboard:(id)sender {
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}
/*-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_passwordTextField])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedDown:YES];
        }
    }
}*/
- (IBAction)login:(id)sender
{
    [self.delegate loginViewControllerDidFinish:self];
}

- (IBAction)alertFailedLogin:(id)sender
{
    UIAlertView *alertView = (UIAlertView *)[[UIAlertView alloc] initWithTitle:@"You Fail" message:@"Failed Login"delegate: nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alertView show];
}
-(IBAction)newUser:(id)sender
{
    NewUserController *controller = [[NewUserController alloc] initWithNibName:@"NewUser" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    
}
-(void)newUserControllerDidFinish:(NewUserController *)controller
{
    //Create person, check to see if person is in database, if yes display alert, if no add person and dismiss modal view
    
    Person *selectedPerson = [Person personWithEmail:controller.usernameTextField.text password:controller.passwordTextField.text type:controller.typeTextField.text];
    
    if (![((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).listPeople containsObject:
         selectedPerson])
        
    {
        Person *newPerson = [Person personWithEmail:controller.usernameTextField.text password:controller.passwordTextField.text type:controller.typeTextField.text]; 
        
        [((Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate).listPeople addObject:newPerson];
        
        // Do whatever is needed upon a successful login.
        [self dismissModalViewControllerAnimated:YES];
        
    } else {
        // Display an error message, and do not dismiss the login screen.
        [controller alertNeedNewUserName:self];
    }
}

-(IBAction)forgotPassword:(id)sender
{
    ForgotPasswordViewController *controller = [[ForgotPasswordViewController alloc] initWithNibName:@"ForgotPasswordView" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];    
}
-(void)forgotPasswordViewControllerDidFinish:(ForgotPasswordViewController *)controller
{
    //Need logic to check user database and send an email to the person that requested their password
    [self dismissModalViewControllerAnimated:YES];
}

@end
