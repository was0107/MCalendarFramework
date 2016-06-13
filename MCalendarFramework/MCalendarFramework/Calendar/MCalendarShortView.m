//
//  MCalendarShortView.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/4/6.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "MCalendarShortView.h"
#import "NSDate+Calendar.h"

@interface MCalendarShortView ()

@property (nonatomic, strong) UIButton *preButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UILabel  *dayLabel;
@property (nonatomic, strong) UILabel  *weekLabel;
@property (nonatomic, strong) UILabel  *monthLabel;

@end

@implementation MCalendarShortView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.preButton];
        [self addSubview:self.nextButton];
        [self addSubview:self.dayLabel];
        [self addSubview:self.weekLabel];
        [self addSubview:self.monthLabel];
    }
    return self;
}


#pragma mark -- Getter && Setter

- (UIButton *) preButton {
    if (!_preButton) {
        _preButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_preButton setImage:[UIImage imageNamed:@"Calendar.bundle/left_normal"] forState:UIControlStateNormal];
        [_preButton setImage:[UIImage imageNamed:@"Calendar.bundle/left_select"] forState:UIControlStateSelected];
        [_preButton setImage:[UIImage imageNamed:@"Calendar.bundle/left_select"] forState:UIControlStateHighlighted];
        _preButton.frame = CGRectMake(0, 0, 40, 40);
        [_preButton addTarget:self action:@selector(preAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _preButton;
}

- (UIButton *) nextButton {
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setImage:[UIImage imageNamed:@"Calendar.bundle/right_normal"] forState:UIControlStateNormal];
        [_nextButton setImage:[UIImage imageNamed:@"Calendar.bundle/right_select"] forState:UIControlStateSelected];
        [_nextButton setImage:[UIImage imageNamed:@"Calendar.bundle/right_select"] forState:UIControlStateHighlighted];
        _nextButton.frame = CGRectMake(155, 0, 40, 40);
        [_nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (UILabel *) dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 40, 40)];
        _dayLabel.text = @"-";
        _dayLabel.font = [UIFont systemFontOfSize:24];
        _dayLabel.textColor = [UIColor whiteColor];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.backgroundColor = [UIColor clearColor];
    }
    return _dayLabel;
}

- (UILabel *) weekLabel {
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 4, 80,20)];
        _weekLabel.text = @"-";
        _weekLabel.font = [UIFont systemFontOfSize:14];
        _weekLabel.textColor = [UIColor whiteColor];
        _weekLabel.backgroundColor = [UIColor clearColor];
    }
    return _weekLabel;
}

- (UILabel *) monthLabel {
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 80, 20)];
        _monthLabel.text = @"-";
        _monthLabel.font = [UIFont systemFontOfSize:14];
        _monthLabel.textColor = [UIColor whiteColor];
        _monthLabel.backgroundColor = [UIColor clearColor];
    }
    return _monthLabel;
}

- (void) setDate:(NSDate *)date {
    _date = date;
    self.dayLabel.text = [NSString stringWithFormat:@"%@", @([date day])];
    self.weekLabel.text = [NSString stringWithFormat:@"星期%@", [date weekday] < 7 ? [date weekdayString] : @"天"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@年%@月", @([date year]), @([date month])];
    if (self.block) {
        self.block(self.date);
    }
}

- (IBAction)preAction:(id)sender {
    self.date = [self.date preDay];
    
}

- (IBAction)nextAction:(id)sender {
    self.date = [self.date nextDay];
}


@end
