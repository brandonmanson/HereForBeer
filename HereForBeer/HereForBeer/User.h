//
//  User.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Venue.h"
#import "VenueList.h"

@interface User : NSObject

@property (strong, nonatomic) FBSDKAccessToken *token;
@property (strong, nonatomic) NSMutableArray *userSelectedVenueList;

+(instancetype)getInstance;
- (void)setAccessToken:(FBSDKLoginManagerLoginResult *) loginResult;

@end
