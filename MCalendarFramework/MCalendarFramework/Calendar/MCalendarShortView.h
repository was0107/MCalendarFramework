//
//  MCalendarShortView.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/4/6.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCalendarShortView : UIView
@property (nonatomic, strong, readonly) UIButton *preButton;
@property (nonatomic, strong, readonly) UIButton *nextButton;
@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) void (^block)(NSDate *date);

@end
