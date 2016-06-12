//
//  EventCardTableViewCell.h
//  HereForBeer
//
//  Created by Brandon Manson on 6/12/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCardTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *cardView;
@property (strong, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *venueNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

- (void)layoutSubviews;
- (void)cardSetup;

@end
