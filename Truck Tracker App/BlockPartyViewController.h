//
//  BlockPartyViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/15/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck.h"
#import "BlockParty.h"
#import "Truck_Tracker_AppAppDelegate.h"


@interface BlockPartyViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
	NSArray			*listParty;			// The master content.
	NSMutableArray	*filteredListParty;	// The content filtered as a result of a search.
    Truck *truck;
    BlockParty *blockparty;
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
}

@property (nonatomic, retain) NSArray *listParty;
@property (nonatomic, retain) NSMutableArray *filteredListParty;
@property (nonatomic, retain) Truck *truck;
@property (nonatomic, retain) BlockParty *blockparty;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

@end

