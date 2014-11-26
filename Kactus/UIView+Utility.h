//
//  UIView+Utility.h
//  Kactus
//
//  Created by Federico Polesello on 24/11/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utility)

@property (setter=setX:, getter=getX) CGFloat x;
@property (setter=setY:, getter=getY) CGFloat y;
@property (setter=setWidth:, getter=getWidth) CGFloat width;
@property (setter=setHeight:, getter=getHeight) CGFloat height;

- (void)addBorderWithColor:(UIColor*)color andWidth:(CGFloat)width andCornerRadius:(CGFloat)cornerRadius;
- (void)removeBorder;
- (CGFloat)getX;
- (CGFloat)getY;
- (CGFloat)getWidth;
- (CGFloat)getHeight;
- (void)setX:(float)x;
- (void)setY:(float)y;
- (void)setWidth:(float)width;
- (void)setHeight:(float)height;

@end
