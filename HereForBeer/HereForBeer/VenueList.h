//
//  VenueList.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/10/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venue.h"

@interface VenueList : NSObject

@property (strong, nonatomic) NSMutableArray *venues;

+(instancetype)getInstance;

- (void)initListWithVenues;
- (void)addNewVenueToList:(Venue *)venue;

@end
