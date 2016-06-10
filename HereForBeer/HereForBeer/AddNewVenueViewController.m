//
//  AddNewVenueViewController.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/10/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "AddNewVenueViewController.h"

@interface AddNewVenueViewController ()
@property (strong, nonatomic) IBOutlet UIButton *addNewVenueButton;
@property (strong, nonatomic) IBOutlet UIButton *findVenueButton;
@property (strong, nonatomic) IBOutlet UITextField *pageIdField;
@property (strong, nonatomic) IBOutlet UILabel *pageNameLabel;

@end

@implementation AddNewVenueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addNewVenueButton.alpha = 0.2;
    _addNewVenueButton.enabled = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)findVenueButtonPressed:(UIButton *)sender {
    FBSDKGraphRequest *request = [self createRequestWithIDString:_pageIdField.text];
    [self makeRequest:request];
}
- (IBAction)addVenueButtonPressed:(UIButton *)sender {
}

- (FBSDKGraphRequest *)createRequestWithIDString:(NSString *)idString {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:[NSString stringWithFormat:@"/%@", idString]
                                  parameters:@{ @"fields": @"name, id",}
                                  HTTPMethod:@"GET"];
    
    return request;
}
- (void)makeRequest:(FBSDKGraphRequest *)request {
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSDictionary *parsedData = (NSDictionary *)result;
        
        _venueToReturn = [self processResponseForVenue:parsedData];
        _pageNameLabel.text = _venueToReturn.name;
        _addNewVenueButton.alpha = 1;
        _addNewVenueButton.enabled = YES;
    }];
}

- (Venue *)processResponseForVenue:(NSDictionary *)parsedData {
    return [Venue initWithVenueName:parsedData[@"name"] andID:parsedData[@"id"]];
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
