//
//  VenuesTableViewController.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/9/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewVenueViewController.h"

@protocol filterEventsDelegate <NSObject>

- (void)populateEventList:(NSMutableArray *)arrayOfVenueIDs;

@end

@interface VenuesTableViewController : UITableViewController

@property (strong, nonatomic) id<filterEventsDelegate>delegate;

@end
