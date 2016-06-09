//
//  EventTableViewController.h
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDateProcessor.h"
#import "FacebookAPIConsumer.h"

@interface EventTableViewController : UITableViewController <AppDateProcessor, FacebookAPIConsumer>

@end