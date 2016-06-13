//
//  MCalendarCollectionCell.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/5.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "MCalendarCollectionCell.h"
#import "CalendarConfig.h"

@interface MCalendarCollectionCell()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) UIColor *normalColor;
@property (nonatomic, strong) MCalendarItem *item;

@end

@implementation MCalendarCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
    }
    return self;
}

- (UILabel *) label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.text = @"";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14.0f];
        _label.numberOfLines = 2;
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}

- (void) doSetContentData:(id) content {
    self.item = (MCalendarItem *) content;
    if(_item.inMonth) {
        if (_item.isToday) {
            NSString *day = [NSString stringWithFormat:@"%@",@([_item.date day])];
            NSString *result = [NSString stringWithFormat:@"%@\n(今天)", day];
            NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:result];
            [attributeString addAttribute:NSFontAttributeName
                                    value:[UIFont systemFontOfSize:12.0f]
                                    range:NSMakeRange(day.length, result.length - day.length)];
            
            _label.attributedText = attributeString;
            _label.textColor = self.isSelected ? [CalendarConfig sharedInstance].todaySelectedTextColor : [CalendarConfig sharedInstance].todayTextColor;
            _label.backgroundColor = [CalendarConfig sharedInstance].todayBackgroundColor;
        }
        else {
            _label.text = [NSString stringWithFormat:@"%@", @([_item.date day])];
            _label.textColor = self.isSelected ? [CalendarConfig sharedInstance].selectTextColor : [CalendarConfig sharedInstance].textColor;
            _label.backgroundColor = [CalendarConfig sharedInstance].backgroundColor;
        }
        
        if (self.isSelected && [_label.text length] > 0) {
            _label.backgroundColor = [CalendarConfig sharedInstance].selectBackgroundColor;
        }
    } else {
        _label.text = @"";
        _label.textColor = [CalendarConfig sharedInstance].outMonthTextColor;
        _label.backgroundColor = [CalendarConfig sharedInstance].outBackgroundColor;
    }
    
}

@end
