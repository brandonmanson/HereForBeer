//
//  EventTableViewController.m
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "EventTableViewController.h"
#import "EventDetailViewController.h"
#import "User.h"

@interface EventTableViewController ()

@end

@implementation EventTableViewController

NSMutableArray *eventList, *pageIds;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"User: %@", [User getInstance]);
    if (![User getInstance]) {
        [self performSegueWithIdentifier:@"loginModalSegue" sender:self];
    }
	
	eventList = [[NSMutableArray alloc] initWithObjects:@"thing1", @"thing2", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if(section == 0) {
		return @"This Week";
	}
	else {
		return @"This Month";
	}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return eventList.count;
	} else {
		return eventList.count;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
	// Configure the cell...
	if (indexPath.section == 0) {
		cell.textLabel.text = [eventList objectAtIndex:indexPath.row];
	} else {
		cell.textLabel.text = [eventList objectAtIndex:indexPath.row];

	}
	
	return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	EventDetailViewController *vc = [segue destinationViewController];
	
	vc.event = [eventList objectAtIndex:[self.tableView indexPathForSelectedRow].row];
}

@end
