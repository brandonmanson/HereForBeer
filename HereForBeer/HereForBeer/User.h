//
//  User.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface User : NSObject

@property (strong, nonatomic) FBSDKAccessToken *token;

+(instancetype)getInstance;
- (void)setAccessToken:(FBSDKLoginManagerLoginResult *) loginResult;

@end
