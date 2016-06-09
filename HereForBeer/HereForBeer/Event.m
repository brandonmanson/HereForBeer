//
//  Event.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Event.h"

@implementation Event

-(id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if(self) {
        self.eventName = dictionary[@"name"];
        self.eventDescription = dictionary[@"description"];
        //need our formatters
        self.startTime = [self dateFromString:dictionary[@"start_time"]];
        self.endTime = [self dateFromString:dictionary[@"end_time"]];
        self.venueName = dictionary[@"place"][@"name"];
        self.venueStreetAddress = [NSString stringWithFormat:@"%@, %@, %@ %@", dictionary[@"place"][@"location"][@"street"], dictionary[@"place"][@"location"][@"city"], dictionary[@"place"][@"location"][@"state"],dictionary[@"place"][@"location"][@"zip"]];
        self.location = CLLocationCoordinate2DMake([dictionary[@"place"][@"location"][@"latitude"] floatValue], [dictionary[@"place"][@"location"][@"longitude"] floatValue]);
    }
    
    return self;
}

-(NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    
    return [formatter dateFromString:dateString];
}

+(id) initWithDictionary:(NSDictionary *)dictionary {
    return [[super alloc] initWithDictionary:dictionary];
}

@end
