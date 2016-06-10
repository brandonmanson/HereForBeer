//
//  FacebookAPIConsumer.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/9/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Venue.h"

@protocol FacebookAPIConsumer <NSObject>

@optional
- (FBSDKGraphRequest *)createRequestWithArrayOfIDs:(NSMutableArray *)arrayOfPageIDs;
@optional
- (FBSDKGraphRequest *)createRequestWithIDString:(NSString *)idString;
- (void)makeRequest:(FBSDKGraphRequest *)request;
@optional
- (NSMutableArray *)processResponseForEvents:(NSDictionary *)parsedData;
@optional
- (Venue *)processResponseForVenue:(NSDictionary *)parsedData;
@optional
- (void)getEvents;
@optional
- (void)getVenueForIDString:(NSString *)idString;

@end
