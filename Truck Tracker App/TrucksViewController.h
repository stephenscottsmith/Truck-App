//
//  SixthViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 10/16/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck_Tracker_AppAppDelegate.h"

@interface TrucksViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
	NSArray			*listContent;			// The master content.
	NSMutableArray	*filteredListContent;	// The content filtered as a result of a search.
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
    
}

@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;





@end