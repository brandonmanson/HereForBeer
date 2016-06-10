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
    _venues = [[NSMutableArray alloc] initWithObjects:
			   [Venue initWithVenueName:@"Hopcat - Detroit" andID:@"648104601902330"],
			   [Venue initWithVenueName:@"Bell's Eccentric Cafe" andID:@"206257849387824"],
			   [Venue initWithVenueName:@"North Center Brewing Company" andID:@"705246812870034"],
			   [Venue initWithVenueName:@"Arbor Brewing Company Microbrewery" andID:@"52450036236"],
			   [Venue initWithVenueName:@"Motor City Brewing Works" andID:@"72603589907"],
			   [Venue initWithVenueName:@"Wolverine State Brewing Co." andID:@"24126462316"],
			   [Venue initWithVenueName:@"Salt Springs Brewery" andID:@"811604502225820"],
			   [Venue initWithVenueName:@"Dearborn Brewing" andID:@"458045230880646"],
			   [Venue initWithVenueName:@"Brew Detroit" andID:@"238957822936775"],
			   [Venue initWithVenueName:@"Motor City Brew Tours" andID:@"107214889574"],
			   [Venue initWithVenueName:@"Ashley's Beer & Grill of Westland" andID:@"113401765351875"],
			   [Venue initWithVenueName:@"Pointless Brewery & Theatre" andID:@"1618453781717569"], nil];
}
- (void)addNewVenueToList:(Venue *)venue {
    [_venues addObject:venue];
}

@end
