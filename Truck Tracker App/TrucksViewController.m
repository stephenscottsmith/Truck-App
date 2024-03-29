//
//  TrucksViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 10/16/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "TrucksViewController.h"
#import "TruckDetailViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"


@implementation TrucksViewController

@synthesize listTrucks, filteredlistTrucks, savedSearchTerm, savedScopeButtonIndex, searchWasActive, truck;

// Private convenience method for grabbing our app delegate.
- (Truck_Tracker_AppAppDelegate *)appDelegate 
{
    return (Truck_Tracker_AppAppDelegate *)UIApplication.sharedApplication.delegate;
}

#pragma mark - 
#pragma mark Lifecycle methods



- (void)viewDidLoad
{
    self.listTrucks = ((Truck_Tracker_AppAppDelegate *)[UIApplication sharedApplication].delegate).listTrucks;
   

	// create a filtered list that will contain products for the search results table.
	self.filteredlistTrucks = [NSMutableArray arrayWithCapacity:[self.listTrucks count]]; 
	
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
	self.filteredlistTrucks = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
	[listTrucks release];
	[filteredlistTrucks release];
	
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
        return [self.filteredlistTrucks count];
    }
    else
    {
        return [self.listTrucks count];
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
    Truck *truckToDisplay = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        truckToDisplay = [self.filteredlistTrucks objectAtIndex:indexPath.row];
    }
    else
    {
        truckToDisplay = [self.listTrucks objectAtIndex:indexPath.row];
    }
	
	cell.textLabel.text = truckToDisplay.name;
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TruckDetailViewController *detailsViewController = [[TruckDetailViewController alloc] initWithNibName:@"TruckDetailView" bundle:nil];
    
	/*
	 If the requesting table view is the search display controller's table view, configure the next view controller using the filtered content, otherwise use the main list.
	 */
	Truck *selectedTruck = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        selectedTruck = [self.filteredlistTrucks objectAtIndex:indexPath.row];
    }
	else
	{
        selectedTruck = [self.listTrucks objectAtIndex:indexPath.row];
    }
	detailsViewController.title = selectedTruck.name;
	detailsViewController.truck = selectedTruck;
    
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
	
	[self.filteredlistTrucks removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
	for (Truck *filteredTruck in listTrucks)
	{
        if ([scope isEqualToString:@"All"] || [filteredTruck.cuisine isEqualToString:scope])
		{
			NSComparisonResult result = [filteredTruck.name compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
          if (result == NSOrderedSame)
			{
                NSLog (@"adding truck");
			[self.filteredlistTrucks addObject:filteredTruck];
            }
		}
	}
}


#pragma mark - UISearchDisplayController Delegate Methods

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
