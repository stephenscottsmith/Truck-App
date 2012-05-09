//
//  TruckMapViewController.m
//  Truck Tracker App
//
//  Created by Scott Smith on 11/10/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "TruckMapViewController.h"

@implementation TruckMapViewController

@synthesize coordinate, mapView;

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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
    MKCoordinateRegion region;
    region.center = self.coordinate;
    MKCoordinateSpan span = {0.4, 0.4};
    region.span = span;
    [mapView setRegion:region animated:YES];
}

@end
