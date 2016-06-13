//
//  MCalendarView.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/5.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MCalendarViewDelegate <NSObject>

- (void) preMonth:(NSDate *) date;

- (void) nextMonth:(NSDate *) date;

- (void) today:(NSDate *) date;

@end

@interface MCalendarView : UIView
@property (nonatomic, assign) BOOL      enableAutoDismiss;
@property (nonatomic, strong) NSDate    *startDate;
@property (nonatomic, strong) NSDate    *selectedDate;
@property (nonatomic, weak) id<MCalendarViewDelegate> delegate;
@property (nonatomic, copy) void (^hideBlock)();
@property (nonatomic, copy) void (^block)(NSDate *date);

- (void) hideCalendar;

- (void) configGustures;

@end
