//
//  EventCardTableViewCell.m
//  HereForBeer
//
//  Created by Brandon Manson on 6/12/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "EventCardTableViewCell.h"

@implementation EventCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    [self cardSetup];
}

- (void)cardSetup {
    [_cardView setAlpha:1];
    _cardView.layer.masksToBounds = NO;
    _cardView.layer.cornerRadius = 1;
    _cardView.layer.shadowOffset = CGSizeMake(-.2f, .2f);
    _cardView.layer.shadowRadius = 1;
    _cardView.layer.shadowOpacity = 0.2;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:_cardView.bounds];
    _cardView.layer.shadowPath = path.CGPath;
}

@end
