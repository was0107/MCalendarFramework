//
//  NSDate+Calendar.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/4/6.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "NSDate+Calendar.h"
#import <UIKit/UIKit.h>

@implementation NSString (NSDate)

- (NSDate *) dateWithFormat:(NSString *)format {
    
    NSDateFormatter*formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date =  [formatter dateFromString:self];
    return date;
}

@end

@implementation NSDate (Calendar)

- (NSCalendar *) __calendar {
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
    return [NSCalendar currentCalendar];
}

- (NSInteger) year {
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitYear) fromDate:self];
    return [components year];
}

- (NSInteger) month {
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitMonth) fromDate:self];
    return [components month];
}

- (NSString *) monthString {
    NSArray *titles = [NSArray arrayWithObjects:@"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十", @"十一", @"十二",nil];
    return [titles objectAtIndex:self.month-1];
}
- (NSInteger) day {
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitDay) fromDate:self];
    return [components day];
}

- (NSInteger) hour {
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitHour) fromDate:self];
    return [components hour];
}

- (NSInteger) minute {
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitMinute) fromDate:self];
    return [components minute];
}

- (NSInteger) second {
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitSecond) fromDate:self];
    return [components second];
}

- (NSInteger) weekday {
    NSCalendar *calendar = [self __calendar];
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *components = [[self __calendar] components:(NSCalendarUnitWeekday) fromDate:self];
    NSInteger result = ([components weekday]);
    return result > 0 ? result : result + 7;
}

- (NSString *) weekdayString {
    NSArray *titles = [NSArray arrayWithObjects:@"一", @"二", @"三", @"四", @"五", @"六", @"日",nil];
    return [titles objectAtIndex:(self.weekday+5)%7];
}

- (NSString *) weekdayStringEx {
    NSArray *titles = [NSArray arrayWithObjects:@"一", @"二", @"三", @"四", @"五", @"六", @"天",nil];
    return [titles objectAtIndex:(self.weekday+5)%7];
}

- (NSInteger) firstWeekdayInThisMonth {
    return [[self firstDateInThisMonth] weekday];
}

- (NSInteger) totalDaysInThisMonth {
    NSRange totaldaysInMonth = [[self __calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return totaldaysInMonth.length;
}

- (NSDate *) firstDateInThisMonth {
    NSDateFormatter*formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *date =  [formatter dateFromString:[NSString stringWithFormat:@"%d-%2d-01", self.year, self.month]];
    return date;
}

- (BOOL)isSameDayAsDate:(NSDate *)otherDate {
    if (!otherDate) {
        return NO;
    }
    NSCalendar *calendar = [self __calendar];
    static int flag = -1;
    if (-1 == flag) {
        flag = [calendar respondsToSelector:@selector(isDate:equalToDate:toUnitGranularity:)] ? 1 : 0 ;
    }
    if (1 == flag) {
        return [calendar isDate:self equalToDate:otherDate toUnitGranularity:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)];
    }
    NSDateComponents *componentsSelf = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSDateComponents *componentsOther = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:otherDate];

    return (
    componentsSelf.year == componentsOther.year &&
    componentsSelf.month == componentsOther.month &&
    componentsSelf.day == componentsOther.day);
}

- (NSDate *) preDay {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = -1;
    NSDate *newDate = [[self __calendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) nextDay {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = +1;
    NSDate *newDate = [[self __calendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) preMonth {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[self __calendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) nextMonth {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[self __calendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSString *) dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate:self];
    return currentDateStr;
}

- (NSString *)relativeDateString
{
    const int SECOND = 1;
    const int MINUTE = 60 * SECOND;
    const int HOUR = 60 * MINUTE;
    const int DAY = 24 * HOUR;
    const int MONTH = 30 * DAY;
    
    NSDate *now = [NSDate date];
    NSTimeInterval delta = [self timeIntervalSinceDate:now] * -1.0;
    
    NSCalendar *calendar = [self __calendar];
    NSUInteger units = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    NSDateComponents *components = [calendar components:units fromDate:self toDate:now options:0];
    
    NSString *relativeString;
    
    if (delta < 0) {
        relativeString = @"";
        
    } else if (delta < 1 * MINUTE) {
        relativeString = (components.second == 1) ? @"1秒钟前" : [NSString stringWithFormat:@"%zi秒钟前",components.second];
        
    } else if (delta < 2 * MINUTE) {
        relativeString =  @"1分钟前";
        
    } else if (delta < 45 * MINUTE) {
        relativeString = [NSString stringWithFormat:@"%zi分钟前",components.minute];
        
    } else if (delta < 90 * MINUTE) {
        relativeString = @"1小时前";
        
    } else if (delta < 24 * HOUR) {
        relativeString = [NSString stringWithFormat:@"%zi小时前",components.hour];
        
    } else if (delta < 48 * HOUR) {
        relativeString = @"昨天";
        
    } else if (delta < 7 * DAY) {
        relativeString = [NSString stringWithFormat:@"%zi天前",components.day];
    }
    else  {
        return [self stringWithFormat:@"YYYY-MM-dd"];
    }
    
    return relativeString;
}
- (NSString *) stringWithFormat:(NSString *)format {
    NSDateFormatter*formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *currentDateStr = [formatter stringFromDate:self];
    return currentDateStr;
}
@end
