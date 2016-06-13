//
//  CalendarConfig.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/3/2.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "CalendarConfig.h"

@implementation CalendarConfig

+ (instancetype) sharedInstance {
    static CalendarConfig *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CalendarConfig alloc] init];
    });
    return instance;
}

- (UIColor *) textColor {
    if (!_textColor) {
        return [UIColor blackColor];
    }
    return _textColor;
}

- (UIColor *) selectTextColor {
    if (!_selectTextColor) {
        return [UIColor blackColor];
    }
    return _selectTextColor;
}

- (UIColor *) backgroundColor {
    if (!_backgroundColor) {
        return [UIColor whiteColor];
    }
    return _backgroundColor;
}

- (UIColor *) todayTextColor {
    if (!_todayTextColor) {
        return [UIColor redColor];
    }
    return _todayTextColor;
}

- (UIColor *) todaySelectedTextColor {
    if (!_todaySelectedTextColor) {
        return [UIColor blackColor];
    }
    return _todaySelectedTextColor;
}

- (UIColor *) todayBackgroundColor {
    if (!_todayBackgroundColor) {
        return [UIColor whiteColor];
    }
    return _todayBackgroundColor;
}


- (UIColor *) outMonthtextColor {
    if (!_outMonthTextColor) {
        return [UIColor lightGrayColor];
    }
    return _outMonthTextColor;
}

- (UIColor *) outMonthSelectedTextColor {
    if (!_outMonthSelectedTextColor) {
        return [UIColor lightGrayColor];
    }
    return _outMonthSelectedTextColor;
}

- (UIColor *) outBackgroundColor {
    if (!_outBackgroundColor) {
        return [UIColor clearColor];
    }
    return _outBackgroundColor;
}

@end
