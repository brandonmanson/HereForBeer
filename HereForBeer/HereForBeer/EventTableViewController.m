//
//  EventTableViewController.m
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "EventTableViewController.h"
#import "EventDetailViewController.h"
#import "Event.h"
#import "User.h"

@interface EventTableViewController ()

@end

@implementation EventTableViewController

NSMutableArray *eventList, *pageIds, *eventsThisWeek, *eventsThisMonth;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"User: %@", [User getInstance]);
    if (![User getInstance]) {
        [self performSegueWithIdentifier:@"loginModalSegue" sender:self];
    }
	
	[self populateEventList];
	
	[self createDateBasedArrays];
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)populateEventList {
	
	Event *event1 = [[Event alloc] init];
	Event *event2 = [[Event alloc] init];
	
	event1.eventName = @"Bell's Tap Takeover";
	event1.startTime = [self dateFromString:@"6/15/2016 6:00 PM"];
	event1.endTime = [self dateFromString:@"6/15/2016 10:00 PM"];
	event1.venueName = @"Hopcat Detroit";
	event1.venueStreetAddress = @"4265 Woodward Ave, Detroit, MI 48201";
	event1.eventDescription = @"Tap takeover. All of the beer. It will be poured.";
	event1.location = CLLocationCoordinate2DMake(42.352402, -83.061622);
	
	event2.eventName = @"Matt's garage beer";
	event2.startTime = [self dateFromString:@"6/25/2016 6:00 PM"];
	event2.endTime = [self dateFromString:@"6/25/2016 10:00 PM"];
	event2.venueName = @"Matt's garage";
	event2.venueStreetAddress = @"8275 Stamford Rd, Ypsilanti MI 48198";
	event2.eventDescription = @"Home brew baby.";
	event2.location = CLLocationCoordinate2DMake(42.273226, -83.598620);
	
	eventList = [[NSMutableArray alloc] initWithObjects:event1, event2, nil];
}

-(NSDate *)dateFromString:(NSString *)dateString {
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
	
	return [formatter dateFromString:dateString];
}

-(NSString *)formatDateToDateTimeString:(NSDate *)date {
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
	
	return [formatter stringFromDate:date];
}

-(NSString *)formatDateToDateString:(NSDate *)date {
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"MM/dd/yyyy"];
	
	return [formatter stringFromDate:date];
}

-(NSString *)formatDateToTimeString:(NSDate *)date {
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"hh:mm a"];
	
	return [formatter stringFromDate:date];
}

-(NSDate *)addDays:(int)numOfDaysToAdd toDate:(NSDate *)originalDate {
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay value:numOfDaysToAdd toDate:originalDate options:nil];
	
	return newDate;
}

- (void)createDateBasedArrays {
	eventsThisWeek = [[NSMutableArray alloc] init];
	eventsThisMonth = [[NSMutableArray alloc] init];
	
	NSDate *today = [NSDate date];
	
	NSDate *sevenDaysInFuture = [self addDays:7 toDate:today];
	NSDate *thirtyDaysInFuture = [self addDays:30 toDate:today];
	
	for (Event *event in eventList) {
		//if date is within the next 7 days
		if([event.startTime compare:sevenDaysInFuture] == NSOrderedAscending) {
			[eventsThisWeek addObject:event];
		}
		else if([event.startTime compare:thirtyDaysInFuture] == NSOrderedAscending) {
			[eventsThisMonth addObject:event];
		}
		//else...outside our time frame
	}
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
		return eventsThisWeek.count;
	} else {
		return eventsThisMonth.count;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
	// Configure the cell...
	
	Event *event;
	
	if (indexPath.section == 0) {
		event = [eventsThisWeek objectAtIndex:indexPath.row];
	} else {
		event = [eventsThisMonth objectAtIndex:indexPath.row];
	}
	
	cell.textLabel.text = event.eventName;
	
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
	
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	
	Event *event;
	
	if (indexPath.section == 0) {
		event = [eventsThisWeek objectAtIndex:indexPath.row];
	} else {
		event = [eventsThisMonth objectAtIndex:indexPath.row];
	}
	
	vc.event = event;
}

@end
