//
//  AppDateFormatters.h
//  HereForBeer
//
//  Created by tstone10 on 6/8/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AppDateProcessor <NSObject>

-(NSDate *)dateFromString:(NSString *)dateString;
-(NSString *)formatDateToDateTimeString:(NSDate *)date;
-(NSString *)formatDateToDateString:(NSDate *)date;
-(NSString *)formatDateToTimeString:(NSDate *)date;
-(NSDate *)addDays:(int)numOfDaysToAdd toDate:(NSDate *)originalDate;

@end
