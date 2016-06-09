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
@property (weak, nonatomic) IBOutlet UITextView *eventDescriptionTextBox;
@property(weak, nonatomic)IBOutlet UILabel *eventDateLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventStartTimeLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventEndTimeLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventVenueNameLabel;
@property(weak, nonatomic)IBOutlet UILabel *eventVenueStreetAddressLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_mapView.delegate = self;
	
	[self populateEventDetailLabels];
	[self setMapLocation];
	[self setPinForEventLocation];
    // Do any additional setup after loading the view.
}

- (void)populateEventDetailLabels {
	_eventNameLabel.text = _event.eventName;
	_eventDescriptionTextBox.text = _event.eventDescription;
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

-(void)setPinForEventLocation {
//	MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//	[annotation setCoordinate:_event.location];
//	[self.mapView addAnnotation:annotation];
	MKPlacemark* marker = [[MKPlacemark alloc] initWithCoordinate:_event.location addressDictionary:nil];
	[self.mapView addAnnotation:marker];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation
{
	MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation1"];
	newAnnotation.pinTintColor = [UIColor greenColor];
	newAnnotation.animatesDrop = YES;
	newAnnotation.canShowCallout = NO;
	[newAnnotation setSelected:YES animated:YES];
	return newAnnotation;
}

-(void)setMapLocation {
	MKCoordinateRegion newRegion;
	newRegion.center.latitude = _event.location.latitude;
	newRegion.center.longitude = _event.location.longitude;
	newRegion.span.latitudeDelta = 0.005;
	newRegion.span.longitudeDelta = 0.005;
	
	[self.mapView setRegion:newRegion animated:YES];
	
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
