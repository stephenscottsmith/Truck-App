//
//  TOEditCuisineViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/24/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import "TOEditCuisineViewController.h"

@interface TOEditCuisineViewController ()

@end

@implementation TOEditCuisineViewController

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

@end
