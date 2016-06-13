//
//  CalendarConfig.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/3/2.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalendarConfig : NSObject

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectTextColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *selectBackgroundColor;

@property (nonatomic, strong) UIColor *todayTextColor;
@property (nonatomic, strong) UIColor *todaySelectedTextColor;
@property (nonatomic, strong) UIColor *todayBackgroundColor;
@property (nonatomic, strong) UIColor *todaySelectBackgroundColor;

@property (nonatomic, strong) UIColor *outMonthTextColor;
@property (nonatomic, strong) UIColor *outMonthSelectedTextColor;
@property (nonatomic, strong) UIColor *outBackgroundColor;
@property (nonatomic, strong) UIColor *outSelectBackgroundColor;


+ (instancetype) sharedInstance;

@end
