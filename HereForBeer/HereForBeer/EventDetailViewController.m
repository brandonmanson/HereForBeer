//
//  EventDetailViewController.m
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()

@property(weak, nonatomic)IBOutlet UILabel *eventNameLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventDescriptionLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventDateLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventStartTimeLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventEndTimeLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventVenueNameLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventVenueStreetAddressLabel;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self populateEventDetailLabels];
    // Do any additional setup after loading the view.
}

- (void)populateEventDetailLabels {
	_eventNameLabel.text = _event.eventName;
	_eventDescriptionLabel.text = _event.eventDescription;
	_eventDateLabel.text = [self formatDateToDateString:_event.startTime];
	_eventStartTimeLabel.text = [self formatDateToTimeString:_event.startTime];
	_eventEndTimeLabel.text = [self formatDateToTimeString:_event.endTime];
	_eventVenueNameLabel.text = _event.venueName;
	_eventVenueStreetAddressLabel.text = _event.venueStreetAddress;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
