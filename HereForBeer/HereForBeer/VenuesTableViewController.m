//
//  VenuesTableViewController.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/9/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "VenuesTableViewController.h"
#import "EventTableViewController.h"
#import "VenueList.h"
#import "User.h"

@interface VenuesTableViewController ()

@end

@implementation VenuesTableViewController

NSMutableArray *venuesArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    EventTableViewController *eventTableView = (EventTableViewController *)_delegate;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[VenueList getInstance].venues count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"venueCell" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    Venue *venueInCell = [[VenueList getInstance].venues objectAtIndex:indexPath.row];
    cell.textLabel.text = venueInCell.name;
    if ([[User getInstance].userSelectedVenueList containsObject:venueInCell]) {
        cell.backgroundColor = [UIColor cyanColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    Venue *venueInSelectedCell = [[VenueList getInstance].venues objectAtIndex:indexPath.row];
    NSLog(@"Before: %lu", [[User getInstance].userSelectedVenueList count]);
    if ([[User getInstance].userSelectedVenueList containsObject:venueInSelectedCell]) {
        cell.backgroundColor = [UIColor whiteColor];
        [[User getInstance].userSelectedVenueList removeObject:venueInSelectedCell];
        
        NSLog(@"After: %lu", [[User getInstance].userSelectedVenueList count]);
        if ([_delegate respondsToSelector:@selector(populateEventList:)]) {
            [_delegate populateEventList:[User getInstance].userSelectedVenueList];
        }
    } else {
        cell.backgroundColor = [UIColor cyanColor];
        [[User getInstance].userSelectedVenueList addObject:venueInSelectedCell];
        if ([_delegate respondsToSelector:@selector(populateEventList:)]) {
            [_delegate populateEventList:[User getInstance].userSelectedVenueList];
        }
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)unwindToVenueList:(UIStoryboardSegue *)unwindSegue sender:(id)sender {
    AddNewVenueViewController *vc = [unwindSegue sourceViewController];
    
    [[VenueList getInstance].venues addObject:vc.venueToReturn];
    [[User getInstance].userSelectedVenueList addObject:vc.venueToReturn];
    [self.tableView reloadData];
    
    //[eventTableCtrl.tableView reloadData];
}

@end
