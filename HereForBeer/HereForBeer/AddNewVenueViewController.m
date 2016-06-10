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
}
- (IBAction)addVenueButtonPressed:(UIButton *)sender {
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
