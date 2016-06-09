//
//  Event.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Event : NSObject <AppDateProcessor>

@property (strong, nonatomic) NSString *eventName;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;
@property (strong, nonatomic) NSString *venueName;
@property (strong, nonatomic) NSString *venueStreetAddress;
@property (strong, nonatomic) NSString *eventDescription;
@property (nonatomic) CLLocationCoordinate2D location;

-(id) initWithDictionary:(NSDictionary *)dictionary;
+(id) initWithDictionary:(NSDictionary *)dictionary;

@end
