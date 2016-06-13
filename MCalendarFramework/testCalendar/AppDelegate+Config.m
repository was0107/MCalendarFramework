//
//  AppDelegate+Config.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/6/13.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "CalendarConfig.h"
#import "UIColor+Extend.h"

@implementation AppDelegate (Config)

- (id) configCalendarColor {
    
    [CalendarConfig sharedInstance].textColor = [UIColor getColor:@"DCDCDC"];
    [CalendarConfig sharedInstance].selectTextColor = [UIColor getColor:@"282B2E"];
    [CalendarConfig sharedInstance].backgroundColor = [UIColor getColor:@"1E2124"];
    
    [CalendarConfig sharedInstance].todayTextColor = [UIColor getColor:@"DCDCDC"];
    [CalendarConfig sharedInstance].todaySelectedTextColor = [UIColor getColor:@"282B2E"];
    [CalendarConfig sharedInstance].todayBackgroundColor = [UIColor getColor:@"1E2124"];
    
    [CalendarConfig sharedInstance].outBackgroundColor = [UIColor getColor:@"1E2124"];
    [CalendarConfig sharedInstance].selectBackgroundColor = [UIColor getColor:@"FAC814"];
    
    return self;
    
}
@end
