//
//  UIColor+Extend.m
//  DealExtreme
//
//  Created by micker on 10-8-30.
//  Copyright 2010 epro. All rights reserved.
//

#import "UIColor+Extend.h"


@implementation UIColor(Extend)

+ (id)getColor:(NSString *) hexColor alpha:(CGFloat)alpha
{
	unsigned int redInt_, greenInt_, blueInt_;
	NSRange rangeNSRange_;
	rangeNSRange_.length = 2;  // 范围长度为2
	
	// 取红色的值
	rangeNSRange_.location = 0; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];

	// 取绿色的值
	rangeNSRange_.location = 2; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
	
	// 取蓝色的值
	rangeNSRange_.location = 4; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];	
	
	return [UIColor colorWithRed:(float)(redInt_/255.0f) green:(float)(greenInt_/255.0f) blue:(float)(blueInt_/255.0f) alpha:alpha];
}

+ (id)getColor:(NSString *) hexColor
{
    return [self getColor:hexColor alpha:1.0f];
}

@end
