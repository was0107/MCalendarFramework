//
//  MCalendarTitleView.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/26.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "MCalendarTitleView.h"
#import "NSDate+Calendar.h"
#import "MImageTitleButton.h"

@interface MCalendarTitleView ()

@property (nonatomic, strong) MImageTitleButton *preButton;
@property (nonatomic, strong) MImageTitleButton *nextButton;
@property (nonatomic, strong) MImageTitleButton *middleButton;

@end

@implementation MCalendarTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.preButton];
        [self addSubview:self.middleButton];
        [self addSubview:self.nextButton];
    }
    return self;
}


#pragma mark -- Getter && Setter

- (MImageTitleButton *) preButton {
    if (!_preButton) {
        _preButton = [MImageTitleButton buttonWithType:UIButtonTypeCustom];
        [_preButton setTitle:@"< 前一天" forState:UIControlStateNormal];
        _preButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        _preButton.frame = CGRectMake(14, 0, 60, CGRectGetHeight(self.bounds));
        _preButton.direction = ImageTitleDirectionLeft;
        [_preButton addTarget:self action:@selector(preAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _preButton;
}

- (MImageTitleButton *) middleButton {
    if (!_middleButton) {
        _middleButton = [MImageTitleButton buttonWithType:UIButtonTypeCustom];
        [_middleButton setTitle:@"" forState:UIControlStateNormal];
        _middleButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        _middleButton.direction = ImageTitleDirectionRight;
        _middleButton.frame = CGRectMake(CGRectGetWidth(self.bounds)/4, 0, CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds));
        [_middleButton addTarget:self action:@selector(middleAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _middleButton;
}

- (MImageTitleButton *) nextButton {
    if (!_nextButton) {
        _nextButton = [MImageTitleButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setTitle:@"后一天 >" forState:UIControlStateNormal];
        _nextButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        _nextButton.direction = ImageTitleDirectionRight;
        _nextButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - 74, 0, 60, CGRectGetHeight(self.bounds));
        [_nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (void) setDate:(NSDate *)date {
    _date = date;
    NSString *dateString = [NSString stringWithFormat:@"%@ 周%@ ", [date stringWithFormat:@"YYYY年MM月dd日"],[date weekdayString]];
    [self.middleButton setTitle:dateString forState:UIControlStateNormal];
    if (self.block) {
        self.block(self.date);
    }
}

- (IBAction)preAction:(id)sender {
    self.date = [self.date preDay];
    if (self.delegate && [self.delegate respondsToSelector:@selector(preDay:)]) {
        [self.delegate preDay:self.date];
    }
}

- (IBAction)nextAction:(id)sender {
    self.date = [self.date nextDay];
    if (self.delegate && [self.delegate respondsToSelector:@selector(nextDay:)]) {
        [self.delegate nextDay:self.date];
    }
}

- (IBAction)middleAction:(id)sender {
    if (self.block) {
        self.block(nil);
    }
}

@end
