//
//  EventTableViewController.m
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//
// SAMPLE GRAPH API REQUEST
//
/* FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
initWithGraphPath:@"/events"
parameters:@{ @"ids": @"648104601902330, 206257849387824",@"since": @"2016-06-01",@"until": @"2016-06-10",}
HTTPMethod:@"GET"];
[request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
    // Insert your code here
}];
*/
//
// Before view loads we need to:
// 1) Check if we have a user object
// 2) If we do, we need to see if that token has expired
// 3) If it has, we need to send them through the login sequence again
// 4) If it hasn't, we should send a request to extend that token
// 5) If we don't have a user, we need to send them to login so we can create that singleton
// 6) After doing all of that ^, we then need to call the graph api and pass in our array of venue ids as well as start date and end date
// 7) We then need to parse that response object, create event objects and send them to the correct arrays to be displayed in the TableView
//
//


#import "EventTableViewController.h"
#import "EventDetailViewController.h"
#import "VenuesTableViewController.h"
#import "Event.h"
#import "User.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface EventTableViewController ()

@end

@implementation EventTableViewController

NSMutableArray *eventList, *eventsThisWeek, *eventsThisMonth;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
    if (![User getInstance].token) {
        _venues = [[NSMutableArray alloc] initWithObjects:[Venue initWithVenueName:@"Hopcat - Detroit" andID:@"648104601902330"], [Venue initWithVenueName:@"Bell's Eccentric Cafe" andID:@"206257849387824"], nil];
        [self performSegueWithIdentifier:@"loginModalSegue" sender:self];
    } else {
        [self populateEventList:_venues];
    }
    // TO-DO: Add more handling for refresh tokens and expired tokens. Leaving as-is for the sake of time and the fact that the token is set to null when simulator is restarted
}

- (FBSDKGraphRequest *)createRequestWithArrayOfIDs:(NSMutableArray *)arrayOfPageIDs {
    NSString *pageIDs = [[NSMutableString alloc] init];
    for(Venue *venue in arrayOfPageIDs) {
        pageIDs = [pageIDs stringByAppendingString:[NSString stringWithFormat:@"%@, ", venue.facebookID]];
    }
    
    pageIDs = [pageIDs stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@", "]];
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/events"
                                  parameters:@{ @"fields": @"name, place, start_time, end_time, description", @"ids": pageIDs,@"since": @"2016-06-09",@"until": @"2016-07-09",}
                                  HTTPMethod:@"GET"];
    
    return request;
}
- (void)makeRequest:(FBSDKGraphRequest *)request {
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSDictionary *parsedData = (NSDictionary *)result;
        
        eventList = [self processResponse:parsedData];
        [self createDateBasedArrays];
        [self.tableView reloadData];
    }];
}
- (NSMutableArray *)processResponse:(NSDictionary *)parsedData {
    NSMutableArray *eventArray = [[NSMutableArray alloc] init];

    for (NSString *key in parsedData) {
        for (NSDictionary *event in [[parsedData objectForKey:key] objectForKey:@"data"]) {
            Event *newEvent = [[Event alloc] initWithDictionary:event];

            [eventArray addObject:newEvent];
        }
    }
    
    return eventArray;
}

- (void)populateEventList:(NSMutableArray *)arrayOfVenueIDs {
    FBSDKGraphRequest *request = [self createRequestWithArrayOfIDs:arrayOfVenueIDs];
    [self makeRequest:request];
}

-(NSDate *)dateFromString:(NSString *)dateString {
	NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    
    //yyyy-mm-ddThh:mm:ss-Z
    //2016-06-07T22:30:00-0400
	
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
	
	[eventsThisWeek sortUsingSelector:@selector(compare:)];
	[eventsThisMonth sortUsingSelector:@selector(compare:)];
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
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", [self formatDateToDateString:event.startTime], event.venueName];
	
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

- (IBAction)unwindToTableView:(UIStoryboardSegue *)unwindSegue sender:(id)sender {
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"eventDetailSegue"]) {
        
        EventDetailViewController *vc = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Event *event;
        
        if (indexPath.section == 0) {
            event = [eventsThisWeek objectAtIndex:indexPath.row];
        } else {
            event = [eventsThisMonth objectAtIndex:indexPath.row];
        }
        
        vc.event = event;
    } else if ([[segue identifier] isEqualToString:@"filterVenuesSegue"]) {
        VenuesTableViewController *vc = [segue destinationViewController];
        [vc setDelegate:self];
    }
}

@end
