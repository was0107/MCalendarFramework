#日历控件模块
##前言
* [MCalendarFramework](https://github.com/was0107/MCalendarFramework)，实现了三种业务开发过程中常用的日历控件，可以随意组合；

##简介
* 1、支持短视图的日历展示，可以查看前、后一天的日历;
* 2、支持长视图的展示，可以查看前、后一天的日历;
* 3、支持按月进行日历查看，支持前、后一月，返回今天等操作，亦支持左、右手势滑动查看，其中按月查看，支持全局配置；
* 4、长视图和月视图可以结合起来进行使用；

##使用说明

```
- (MCalendarShortView *) calendarShortView {
    if (!_calendarShortView) {
        _calendarShortView = [[MCalendarShortView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
        _calendarShortView.backgroundColor = [UIColor getColor:@"1E2124"];
        _calendarShortView.date = [NSDate date];
    }
    return _calendarShortView;
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

```
* 2、按月查看时的样式设置
```
[CalendarConfig sharedInstance].textColor = [UIColor getColor:@"DCDCDC"];
[CalendarConfig sharedInstance].selectTextColor = [UIColor getColor:@"282B2E"];
[CalendarConfig sharedInstance].backgroundColor = [UIColor getColor:@"1E2124"];

[CalendarConfig sharedInstance].todayTextColor = [UIColor getColor:@"DCDCDC"];
[CalendarConfig sharedInstance].todaySelectedTextColor = [UIColor getColor:@"282B2E"];
[CalendarConfig sharedInstance].todayBackgroundColor = [UIColor getColor:@"1E2124"];

[CalendarConfig sharedInstance].outBackgroundColor = [UIColor getColor:@"1E2124"];
[CalendarConfig sharedInstance].selectBackgroundColor = [UIColor getColor:@"FAC814"];
```

##效果图展示
为更好的展示效果，请耐心等待
<br>
实际项目中使用效果
<img src="https://raw.githubusercontent.com/was0107/MCalendarFramework/master/images/calendar1.png" width="50%">
<br>
Demo效果
<img src="https://raw.githubusercontent.com/was0107/MCalendarFramework/master/images/calendar.png" width="50%">
