//
//  FacebookLoginViewController.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@protocol populateEventsFromLoginDelegate <NSObject>

- (void)populateEventsFromLogin;

@end

@interface FacebookLoginViewController : UIViewController <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) id<populateEventsFromLoginDelegate>delegate;

@end
