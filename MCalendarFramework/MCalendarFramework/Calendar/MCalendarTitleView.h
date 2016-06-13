//
//  MCalendarTitleView.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/26.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MImageTitleButton.h"

@protocol MCalendarTitleViewDelegate <NSObject>

- (void) preDay:(NSDate *) date;

- (void) nextDay:(NSDate *) date;

@end

@interface MCalendarTitleView : UIView

@property (nonatomic, strong, readonly) MImageTitleButton *preButton;
@property (nonatomic, strong, readonly) MImageTitleButton *nextButton;
@property (nonatomic, strong, readonly) MImageTitleButton *middleButton;
@property (nonatomic, weak) id<MCalendarTitleViewDelegate> delegate;

@property (nonatomic, copy) NSDate *date;

@property (nonatomic, copy) void (^block)(NSDate *date);

@end
