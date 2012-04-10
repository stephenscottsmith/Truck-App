//
//  SecondViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/15/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "MapViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"
#import "TruckAnnotation.h"

@implementation MapViewController

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
    // We will be accessing the delegate.
    Truck_Tracker_AppAppDelegate *delegate = (Truck_Tracker_AppAppDelegate *)[UIApplication sharedApplication].delegate;
    
    // Derive our map coordinate from whatever the app delegate says it should be.
    self.coordinate = delegate.coordinate;
    MKCoordinateRegion region;
    region.center = self.coordinate;
    MKCoordinateSpan span = {0.4, 0.4};
    region.span = span;
    [mapView setRegion:region animated:YES];
    
    // Drop a pin corresponding to the selected truck.
    // First, create a truck annotation.
    TruckAnnotation *truckAnnotation = [TruckAnnotation withTruck: delegate.selectedTruck];
    [mapView addAnnotation:truckAnnotation];
}

-(IBAction)logout:(id)sender
{
    
}

@end