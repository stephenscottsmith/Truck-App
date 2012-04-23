//
//  TruckDetailViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/29/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck.h"

@interface TruckDetailViewController : UIViewController {
    Truck *truck;
    
    UITextField *cuisineTextField;
}

@property (nonatomic, retain) Truck *truck;
@property (nonatomic, retain) IBOutlet UITextField *cuisineTextField;

-(IBAction)displayContact:(id)sender;

-(IBAction)displayMenu:(id)sender;

-(IBAction)displayMap:(id)sender;

-(IBAction)displaySchedule:(id)sender;

-(IBAction)addTruckToFavorites:(id)sender;

@end
