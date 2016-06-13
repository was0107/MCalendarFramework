//
//  NSDate+Calendar.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/4/6.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSDate)

- (NSDate *) dateWithFormat:(NSString *)format;
@end

@interface NSDate (Calendar)

- (NSInteger) year;

- (NSInteger) month;

- (NSString *) monthString;

- (NSInteger) day;

- (NSInteger) hour;

- (NSInteger) minute;

- (NSInteger) second;

- (NSInteger) weekday;

- (NSString *) weekdayString;

- (NSString *) weekdayStringEx;

- (NSInteger) firstWeekdayInThisMonth;

- (NSInteger) totalDaysInThisMonth;

- (NSDate *) firstDateInThisMonth;

- (BOOL)isSameDayAsDate:(NSDate *)otherDate;

- (NSDate *) preDay;

- (NSDate *) nextDay;

- (NSDate *) preMonth;

- (NSDate *) nextMonth;

- (NSString *) dateString;

- (NSString *) stringWithFormat:(NSString *)format;

- (NSString *)relativeDateString;


@end
