//
//  FacebookAPIConsumer.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/9/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@protocol FacebookAPIConsumer <NSObject>

- (FBSDKGraphRequest *)createRequest:(NSMutableArray *)arrayOfPageIDs;
- (void)makeRequest:(FBSDKGraphRequest *)request;
- (NSMutableArray *)processResponse:(NSDictionary *)parsedData;

@end
