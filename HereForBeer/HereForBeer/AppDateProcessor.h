//
//  AppDateFormatters.h
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AppDateProcessor <NSObject>

@optional
-(NSDate *)dateFromString:(NSString *)dateString;
@optional
-(NSString *)formatDateToDateTimeString:(NSDate *)date;
@optional
-(NSString *)formatDateToDateString:(NSDate *)date;
@optional
-(NSString *)formatDateToTimeString:(NSDate *)date;
@optional
-(NSDate *)addDays:(int)numOfDaysToAdd toDate:(NSDate *)originalDate;

@end
