//
//  MImageTitleButton.m
//  GoldCalendarFramework
//
//  Created by Micker on 16/5/26.
//  Copyright © 2016年 micker.cn. All rights reserved.
//

#import "MImageTitleButton.h"

@implementation MImageTitleButton


- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect frame = [super titleRectForContentRect:contentRect];
    switch (self.direction) {
        case ImageTitleDirectionNone:
            
            break;
        case ImageTitleDirectionLeft:
            frame.origin.x = CGRectGetMinX(frame) + CGRectGetWidth([self imageRectForContentRect:contentRect]);
            break;
        case ImageTitleDirectionRight:
            frame.origin.x = CGRectGetMinX(frame) - CGRectGetWidth([self imageRectForContentRect:contentRect]);
            break;
        case ImageTitleDirectionUp:
            
            break;
        case ImageTitleDirectionDown:
            
            break;
            
        default:
            break;
    }
    return frame;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect frame = [super imageRectForContentRect:contentRect];
    
    switch (self.direction) {
        case ImageTitleDirectionNone:
            
            break;
        case ImageTitleDirectionLeft:
            frame.origin.x = CGRectGetMaxX(contentRect) - CGRectGetWidth(frame) +  self.imageEdgeInsets.right - self.imageEdgeInsets.left;
            break;
        case ImageTitleDirectionRight:
            frame.origin.x = CGRectGetMaxX(contentRect) - CGRectGetWidth(frame) -  self.imageEdgeInsets.right + self.imageEdgeInsets.left;
            break;
        case ImageTitleDirectionUp:
            
            break;
        case ImageTitleDirectionDown:
            
            break;
            
        default:
            break;
    }
    return frame;
}

@end
