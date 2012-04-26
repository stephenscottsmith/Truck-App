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

@synthesize listCuisine;

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
    self.listCuisine = [[NSArray alloc] initWithObjects:@"African",@"American",@"Asian Fusion",@"Barbeque",@"Breakfast",@"British",@"Burgers",@"Cajun/Creole",@"Caribbean",@"Chinese",@"Crepes",@"Cuban",@"Deli",@"Filipino",@"French",@"German",@"Greek",@"Hawaiian",@"Himalayan/Nepalese",@"Hot Dogs",@"Hungarian",@"Indian",@"Irish",@"Italian",@"Japanese",@"Korean",@"Kosher",@"Malaysian",@"Mediterranean",@"Mexican",@"Middle Eastern",@"Modern European",@"Mongolian",@"Moroccan",@"Persian",@"Pizza",@"Polish",@"Portuguese",@"Russian",@"Sandwiches",@"Seafood",@"Spanish",@"Steak",@"Sushi",@"Taiwanese",@"Thai",@"Vegan",@"Vegetarian",@"Vietnamese", nil];
    
    [listCuisine release];
    
    
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

#pragma mark -
#pragma mark UITableView data source and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listCuisine count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cuisine"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cuisine"]autorelease];
    }
    cell.textLabel.text = [listCuisine objectAtIndex:indexPath.row];
	return cell;
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TruckDetailViewController *detailsViewController = [[TruckDetailViewController alloc] initWithNibName:@"TruckDetailView" bundle:nil];
	 
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
*/
@end
