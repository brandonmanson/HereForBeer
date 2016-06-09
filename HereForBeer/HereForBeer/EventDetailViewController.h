//
//  EventDetailViewController.h
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "AppDateProcessor.h"

@interface EventDetailViewController : UIViewController <AppDateProcessor>

@property (strong, nonatomic) Event *event;

@end
