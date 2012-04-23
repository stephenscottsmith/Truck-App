//
//  FavoritesViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 2/7/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck_Tracker_AppAppDelegate.h"

@interface FavoritesViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
    NSMutableArray *listOfTrucks;
    NSMutableArray *filteredListOfTrucks;
    Truck *truck;
    
    NSString        *savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL            searchWasActive;
    
}

@property (nonatomic, retain) NSMutableArray *listOfTrucks;
@property (nonatomic, retain) NSMutableArray *filteredListOfTrucks;
@property (nonatomic, retain) Truck *truck;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

@end
