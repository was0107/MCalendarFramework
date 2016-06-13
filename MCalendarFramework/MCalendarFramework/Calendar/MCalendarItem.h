//
//  MCalendarItem.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/4/6.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDate+Calendar.h"

@interface MCalendarItem : NSObject

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, assign) BOOL isToday;

@property (nonatomic, assign) BOOL inMonth;

- (id) initWitDate:(NSDate *) date inMonth:(BOOL) inMonth;

@end



@interface CalendarManager : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong, readonly) NSMutableArray  *allDates;

@end