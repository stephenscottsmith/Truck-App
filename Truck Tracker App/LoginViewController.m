//
//  LoginViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize delegate = _delegate;
@synthesize usernameTextField = _usernameTextField;
@synthesize passwordTextField = _passwordTextField;

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


@end
