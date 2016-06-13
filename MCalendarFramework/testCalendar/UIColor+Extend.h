//
//  UIColor+Extend.h
//  DealExtreme
//
//  Created by micker on 10-8-30.
//  Copyright 2010 epro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 扩展UIColor类
@interface UIColor(Extend)

// 将十六进制的颜色值转为objective-c的颜色
+ (id)getColor:(NSString *) hexColor;

+ (id)getColor:(NSString *) hexColor alpha:(CGFloat)alpha;

@end