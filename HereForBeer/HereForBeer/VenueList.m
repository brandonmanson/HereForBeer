//
//  VenueList.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/10/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "VenueList.h"

@implementation VenueList

+(instancetype)getInstance {
    static VenueList *venueList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        venueList = [[VenueList alloc]initPrivately];
    });
    return venueList;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[User sharedAccessToken]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivately {
    self = [super init];
    return self;
}

- (void)initListWithVenues {
    _venues = [[NSMutableArray alloc] initWithObjects:[Venue initWithVenueName:@"Hopcat - Detroit" andID:@"648104601902330"], [Venue initWithVenueName:@"Bell's Eccentric Cafe" andID:@"206257849387824"], nil];
}
- (void)addNewVenueToList:(Venue *)venue {
    [_venues addObject:venue];
}

@end
