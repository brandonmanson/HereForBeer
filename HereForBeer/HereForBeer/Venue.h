//
//  Venue.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/10/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *facebookID;

- (id)initWithVenueName:(NSString *)name andID:(NSString *)facebookID;
+ (id)initWithVenueName:(NSString *)name andID:(NSString *)facebookID;

@end
