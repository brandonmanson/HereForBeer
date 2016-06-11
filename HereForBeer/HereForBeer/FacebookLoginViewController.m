//
//  FacebookLoginViewController.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "FacebookLoginViewController.h"
#import "User.h"

@interface FacebookLoginViewController ()

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

@implementation FacebookLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginButton = [[FBSDKLoginButton alloc]initWithFrame:CGRectZero];
    _loginButton.center = self.view.center;
    [self.view addSubview:_loginButton];
    [_loginButton setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    // Init singleton and pass it the access token
    [[User getInstance]setAccessToken:result];
    if ([User getInstance]) {
        [_delegate populateEventsFromLogin];
        [self performSegueWithIdentifier:@"unwindToTableView" sender:self];
    }
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
