//
//  Venue.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/10/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Venue.h"

@implementation Venue

- (id)initWithVenueName:(NSString *)name andID:(NSString *)facebookID {
    self = [super init];
    if (self) {
        _name = name;
        _facebookID = facebookID;
    }
    return self;
}

+ (id)initWithVenueName:(NSString *)name andID:(NSString *)facebookID {
    return [[super alloc]initWithVenueName:name andID:facebookID];
}


@end
