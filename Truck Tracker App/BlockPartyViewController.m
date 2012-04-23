//
//  BlockPartyViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/15/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "BlockPartyViewController.h"
#import "Truck.h"
#import "Truck_Tracker_AppAppDelegate.h"
#import "BlockPartyDetailViewController.h"

@implementation BlockPartyViewController

@synthesize listParty, filteredListParty, savedSearchTerm, savedScopeButtonIndex, searchWasActive, truck, blockparty;


#pragma mark - 
#pragma mark Lifecycle methods

- (void)viewDidLoad
{	
    self.listParty = ((Truck_Tracker_AppAppDelegate *)[UIApplication sharedApplication].delegate).listParty;
    
	// create a filtered list that will contain products for the search results table.
	self.filteredListParty = [NSMutableArray arrayWithCapacity:[self.listParty count]];
	
	// restore search settings if they were saved in didReceiveMemoryWarning.
    if (self.savedSearchTerm)
	{
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setSelectedScopeButtonIndex:self.savedScopeButtonIndex];
        [self.searchDisplayController.searchBar setText:savedSearchTerm];
        
        self.savedSearchTerm = nil;
    }
	
	[self.tableView reloadData];
	self.tableView.scrollEnabled = YES;
}

- (void)viewDidUnload
{
	self.filteredListParty = nil;
}

- (void)viewDidDisappear:(BOOL)animated
{
    // save the state of the search UI so that it can be restored if the view is re-created
    self.searchWasActive = [self.searchDisplayController isActive];
    self.savedSearchTerm = [self.searchDisplayController.searchBar text];
    self.savedScopeButtonIndex = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
}

- (void)dealloc
{
	[listParty release];
	[filteredListParty release];
	
	[super dealloc];
}


#pragma mark -
#pragma mark UITableView data source and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	/*
	 If the requesting table view is the search display controller's table view, return the count of
     the filtered list, otherwise return the count of the main list.
	 */
    
	if (tableView == self.searchDisplayController.searchResultsTableView)
    	{
            return [self.filteredListParty count];
        }
    	else
    	{
            return [self.listParty count];
        }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
    //	/*
    //	 If the requesting table view is the search display controller's table view, configure the cell using the filtered content, otherwise use the main list.
    //	 */
    	//This returns the  block party.
    
    BlockParty *blockPartyToDisplay;
        if (tableView == self.searchDisplayController.searchResultsTableView)
    	{
            blockPartyToDisplay = [self.filteredListParty objectAtIndex:indexPath.row];
        }
    	else
    	{
            blockPartyToDisplay = [self.listParty objectAtIndex:indexPath.row];
        }
	
	cell.textLabel.text = blockPartyToDisplay.name;
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BlockPartyDetailViewController *detailsViewController = [[BlockPartyDetailViewController alloc] initWithNibName:@"BlockPartyDetailView" bundle:nil];
    
	/*
	 If the requesting table view is the search display controller's table view, configure the next view controller using the filtered content, otherwise use the main list.
	 */
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        blockparty = [self.filteredListParty objectAtIndex:indexPath.row];
    }
	else
	{
        blockparty = [self.listParty objectAtIndex:indexPath.row];
    }
	detailsViewController.title = blockparty.name;
    detailsViewController.blockparty = blockparty;
    
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}


#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredListParty removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (BlockParty *filteredBlockParty in listParty)
	{
		if ([scope isEqualToString:@"All"] || [filteredBlockParty.name isEqualToString:scope])
		{
			NSComparisonResult result = [filteredBlockParty.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.filteredListParty addObject:filteredBlockParty];
            }
		}
	}
}


#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


@end