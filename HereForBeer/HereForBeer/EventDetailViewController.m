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
	_eventNameLabel.text = _event;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
