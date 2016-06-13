//
//  ViewController.m
//  testCalendar
//
//  Created by Micker on 16/5/5.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "ViewController.h"
#import "MCalendarView.h"
#import "MCalendarShortView.h"
#import "MCalendarTitleView.h"
#import "UIColor+Extend.h"

@interface ViewController ()
@property (nonatomic, strong) MCalendarView *calendarView;
@property (nonatomic, strong) MCalendarShortView *calendarShortView;
@property (nonatomic, strong) MCalendarTitleView *titleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.calendarShortView];
    [self.view addSubview:self.calendarView];
    [self.view addSubview:self.titleView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MCalendarShortView *) calendarShortView {
    if (!_calendarShortView) {
        _calendarShortView = [[MCalendarShortView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
        _calendarShortView.backgroundColor = [UIColor getColor:@"1E2124"];
        _calendarShortView.date = [NSDate date];
    }
    return _calendarShortView;
}

- (MCalendarView *) calendarView {
    if (!_calendarView) {
        _calendarView = [[MCalendarView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 500)];
        _calendarView.backgroundColor = [UIColor getColor:@"1E2124"];
        _calendarView.startDate = self.calendarView.selectedDate = [NSDate date];
        _calendarView.enableAutoDismiss = NO;
        __weak typeof(self) weakSelf = self;
        _calendarView.block = ^(NSDate *date) {
            weakSelf.calendarView.selectedDate = date;
        };
    }
    return _calendarView;
}

- (MCalendarTitleView *) titleView {
    if (!_titleView) {
        _titleView = [[MCalendarTitleView alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.bounds), 44)];
        _titleView.backgroundColor = [UIColor getColor:@"1E2124"];
        [_titleView.preButton setTitleColor:[UIColor getColor:@"666666"] forState:UIControlStateNormal];
        [_titleView.nextButton setTitleColor:[UIColor getColor:@"666666"] forState:UIControlStateNormal];
        [_titleView.middleButton setTitleColor:[UIColor getColor:@"DCDCDC"] forState:UIControlStateNormal];
        _titleView.preButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        _titleView.nextButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        _titleView.middleButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [_titleView.middleButton setImage:[UIImage imageNamed:@"Calendar.bundle/up"] forState:UIControlStateNormal];
        _titleView.middleButton.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
        _titleView.date = [NSDate date];
    }
    return _titleView;
}


@end
