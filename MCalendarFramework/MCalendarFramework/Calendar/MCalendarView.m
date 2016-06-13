//
//  MCalendarView.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/5.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "MCalendarView.h"
#import "MCalendarCollectionCell.h"
#import "MCalendarItem.h"


@interface MCalendarView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView  *headerView;
@property (nonatomic, strong) UILabel *montLabel;
@property (nonatomic, strong) UIButton *preButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *todayButton;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) CalendarManager *dateManger;


@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation MCalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.enableAutoDismiss = YES;
        [self addSubview:self.preButton];
        [self addSubview:self.montLabel];
        [self addSubview:self.todayButton];
        [self addSubview:self.nextButton];
        [self addSubview:self.headerView];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.backgroundView.frame = CGRectMake(0,
                                           CGRectGetMaxY(self.frame),
                                           CGRectGetWidth(self.superview.frame),
                                           CGRectGetHeight(self.superview.frame) - CGRectGetMaxY(self.frame));
}

- (void)didMoveToSuperview {
    if (self.superview) {
        [self.superview insertSubview:self.backgroundView belowSubview:self];
    } else {
        [self.backgroundView removeFromSuperview];
    }
}

#pragma mark -- Getter && Stter

- (CalendarManager *) dateManger {
    if (!_dateManger) {
        _dateManger = [[CalendarManager alloc] init];
    }
    return _dateManger;
}


- (UIView *) backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        _backgroundView.backgroundColor = [UIColor clearColor];
        _backgroundView.clipsToBounds = YES;
        [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideCalendarView:)]];
    }
    return _backgroundView;
}

- (UILabel *) montLabel {
    if (!_montLabel) {
        _montLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)/2-70, 7, 140, 30)];
        _montLabel.textAlignment = NSTextAlignmentCenter;
        _montLabel.textColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1];
        _montLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    }
    return _montLabel;
}

- (UIButton *) preButton {
    if (!_preButton) {
        _preButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _preButton.frame = CGRectMake(CGRectGetWidth(self.bounds)/2 -104, 2, 44, 40);
        [_preButton setImage:[UIImage imageNamed:@"Calendar.bundle/left_normal"] forState:UIControlStateNormal];
        [_preButton setImage:[UIImage imageNamed:@"Calendar.bundle/left_select"] forState:UIControlStateSelected];
        [_preButton setImage:[UIImage imageNamed:@"Calendar.bundle/left_select"] forState:UIControlStateHighlighted];
        _preButton.imageEdgeInsets = UIEdgeInsetsMake(8, 12, 8, 12);
        [_preButton addTarget:self action:@selector(preMonthAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _preButton;
}

- (UIButton *) todayButton {
    if (!_todayButton) {
        _todayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _todayButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - 64, 10, 50, 20);
        [_todayButton addTarget:self action:@selector(todayAction:) forControlEvents:UIControlEventTouchUpInside];
        _todayButton.backgroundColor = [UIColor clearColor];
        _todayButton.layer.borderColor = [[UIColor colorWithRed:250.0/255.0 green:200./255.0 blue:20./255. alpha:1] CGColor];
        _todayButton.layer.cornerRadius = 2.0f;
        _todayButton.layer.borderWidth = .5f;
        _todayButton.titleLabel.font = [UIFont systemFontOfSize:11.0f];
        [_todayButton setTitle:@"返回今天" forState:UIControlStateNormal];
        [_todayButton setTitleColor:[UIColor colorWithRed:250.0/255.0 green:200./255.0 blue:20./255. alpha:1] forState:UIControlStateNormal];
    }
    return _todayButton;
}

- (UIButton *) nextButton {
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(CGRectGetWidth(self.bounds)/2 + 60, 2, 44, 40);
        [_nextButton setImage:[UIImage imageNamed:@"Calendar.bundle/right_normal"] forState:UIControlStateNormal];
        [_nextButton setImage:[UIImage imageNamed:@"Calendar.bundle/right_select"] forState:UIControlStateSelected];
        [_nextButton setImage:[UIImage imageNamed:@"Calendar.bundle/right_select"] forState:UIControlStateHighlighted];
        _nextButton.imageEdgeInsets = UIEdgeInsetsMake(8, 12, 8, 12);
        [_nextButton addTarget:self action:@selector(nextMonthAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (UIView *) headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nextButton.frame), CGRectGetWidth(self.bounds), 30)];
        _headerView.backgroundColor = [UIColor clearColor];
        int uwidht = (int)(CGRectGetWidth(self.bounds)/7);
        NSArray *titles = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
        for (int i = 0 ; i < 7; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(uwidht * i , 0, uwidht, CGRectGetHeight(_headerView.bounds))];
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont systemFontOfSize:12.0f];
            label.text = titles[i];
            label.textColor = [UIColor colorWithRed:102./255. green:102./255. blue:102./255. alpha:1];
            [_headerView addSubview:label];
        }
    }
    return _headerView;
}

- (UICollectionView *) collectionView {
    if (!_collectionView) {
        int uwidht = (int)(CGRectGetWidth(self.bounds)/7);
        CGRect frame = self.bounds;
        frame.origin.y = CGRectGetMaxY(_headerView.frame);
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[MCalendarCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([MCalendarCollectionCell class])];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *) flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 1.f;
        _flowLayout.minimumInteritemSpacing = 1.0f;
        int uwidht = (int)((CGRectGetWidth(self.bounds)-8)/7);
        int space =  (int)CGRectGetWidth(self.bounds) - uwidht * 7;
        float space1 =  .5f;
        
        _flowLayout.sectionInset = UIEdgeInsetsMake(space1*2, space1, space1*2, space1);
        _flowLayout.itemSize = CGSizeMake(uwidht, uwidht-5);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}

- (void) setStartDate:(NSDate *)startDate {
    _startDate = startDate;
    self.dateManger.date = startDate;
    [self.collectionView reloadData];
    
    self.montLabel.text = [NSString stringWithFormat:@"%@ 月 %@", [startDate monthString],@([startDate year])];
    CGRect rect = [self.collectionView frame];
    rect.size.height = [self.dateManger.allDates count] / 7 * (CGRectGetWidth(self.bounds)/7 - 5);
    float y = rect.origin.y;
    [self.collectionView setFrame:rect];
    rect.origin.y = self.frame.origin.y;
    rect.size.height += CGRectGetMaxY(_headerView.frame);
    [self setFrame:rect];
}

#pragma mark -- UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dateManger.allDates count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MCalendarCollectionCell *cell = (MCalendarCollectionCell *) [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MCalendarCollectionCell class])
                                                                                                                forIndexPath:indexPath];
    MCalendarItem *item = [self.dateManger.allDates objectAtIndex:indexPath.item];
    item.isToday = [item.date isSameDayAsDate:[NSDate date]];
    cell.selected = [item.date isSameDayAsDate:self.selectedDate];
    [cell doSetContentData:item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MCalendarItem *item = [self.dateManger.allDates objectAtIndex:indexPath.item];
    self.selectedDate = item.date;
    if (self.block && item.inMonth) {
        [collectionView reloadData];
        self.block(item.date);
    }
}

#pragma mark -- Section Action

- (IBAction) preMonthAction:(id)sender {
    [self setStartDate: [self.startDate preMonth]];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(preMonth:)]) {
        [self.delegate preMonth:self.startDate];
    }
}

- (IBAction) nextMonthAction:(id)sender {
    [self setStartDate: [self.startDate nextMonth]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(nextMonth:)]) {
        [self.delegate nextMonth:self.startDate];
    }
}

- (IBAction)todayAction:(id)sender {
    self.selectedDate = [NSDate date];
    [self setStartDate:[NSDate date]];
    if (self.block) {
        self.block(self.startDate);
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(today:)]) {
        [self.delegate today:self.startDate];
    }
}

#pragma mark --Action

- (void) hideCalendar {
    [self hideCalendarView:nil];
}

- (void) hideCalendarView:(UIGestureRecognizer *) recognizer {
    if (!self.enableAutoDismiss) {
        return;
    }
    CGRect rect = self.frame;
    self.frame = rect;
    rect.origin.y = -rect.size.height;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2f animations:^{
        weakSelf.frame = rect;
        if (weakSelf.hideBlock) {
            weakSelf.hideBlock();
        }
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

#pragma mark --Gesturer

- (void) configGestures {
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swapGestureRecognizer:)];
    recognizer.direction =  UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:recognizer];
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swapGestureRecognizer:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:recognizer];
}

- (void) swapGestureRecognizer:(UISwipeGestureRecognizer *) recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        [self preMonthAction:nil];
    } else {
        [self nextMonthAction:nil];
    }
}

@end
