//
//  User.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "User.h"

@implementation User

+(instancetype)getInstance {
    static User *applicationUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        applicationUser = [[User alloc]initPrivately];
    });
    return applicationUser;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[User sharedAccessToken]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivately {
    self = [super init];
    _userSelectedVenueList = [[VenueList getInstance].venues mutableCopy];
    return self;
}

- (void)setAccessToken:(FBSDKLoginManagerLoginResult *)loginResult {
    _token = loginResult.token;
}

@end
