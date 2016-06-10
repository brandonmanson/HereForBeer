//
//  AddNewVenueViewController.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/10/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookAPIConsumer.h"
#import "Venue.h"

@interface AddNewVenueViewController : UIViewController <FacebookAPIConsumer>

@property (strong, nonatomic) Venue *venueToReturn;

@end
