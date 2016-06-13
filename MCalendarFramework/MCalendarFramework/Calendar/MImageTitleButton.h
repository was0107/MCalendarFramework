//
//  MImageTitleButton.h
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/26.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImageTitleDirection) {
    ImageTitleDirectionNone,//默认从0开始
    ImageTitleDirectionLeft,
    ImageTitleDirectionRight,
    ImageTitleDirectionUp,
    ImageTitleDirectionDown,
};

@interface MImageTitleButton : UIButton
@property (nonatomic, assign) ImageTitleDirection direction;

@end
