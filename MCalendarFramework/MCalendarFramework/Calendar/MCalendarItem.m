//
//  MCalendarItem.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/4/6.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "MCalendarItem.h"

@implementation MCalendarItem

- (id) initWitDate:(NSDate *) date inMonth:(BOOL) inMonth {
    self = [super init];
    if (self) {
        self.inMonth = inMonth;
        self.date = date;
    }
    return self;
}

@end

@interface CalendarManager()
@property (nonatomic, strong) NSMutableArray  *allDates;

@end

@implementation CalendarManager

- (void) setDate:(NSDate *)date {
    if (_date != date) {
        _date = date;
        [self computeData];
    }
}

- (void) computeData {
    self.allDates = [NSMutableArray array];
    
    NSDate *startDate = [_date firstDateInThisMonth];
    
    for (int i = 1 ,total = [_date firstWeekdayInThisMonth]; i < total; i++) {
        startDate = [startDate preDay];
        [_allDates insertObject:[[MCalendarItem alloc] initWitDate:startDate inMonth:NO] atIndex:0];
    }
    
    startDate = [_date firstDateInThisMonth];
    
    for (int i = 0 ,total = [_date totalDaysInThisMonth]; i < total; i++) {
        [_allDates addObject:[[MCalendarItem alloc] initWitDate:startDate inMonth:YES]];
        startDate = [startDate nextDay];
    }

    for (int i = [startDate weekday] ,total = 7; 1 != i && i <= total; i++) {
        [_allDates addObject:[[MCalendarItem alloc] initWitDate:startDate inMonth:NO]];
        startDate = [startDate nextDay];
    }
}

@end