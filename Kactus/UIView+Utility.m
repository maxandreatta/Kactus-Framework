//
//  UIView+Utility.m
//  Kactus
//
//  Created by Federico Polesello on 24/11/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)

- (void)addBorderWithColor:(UIColor*)color andWidth:(CGFloat)width andCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.cornerRadius = cornerRadius;
    
}

- (void)removeBorder {
    
    self.layer.borderColor = nil;
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;

}

- (CGFloat)getX {

    return self.frame.origin.x;
    
}

- (CGFloat)getY {
    
    return self.frame.origin.y;
    
}

- (CGFloat)getWidth {

    return self.frame.size.width;
    
}

- (CGFloat)getHeight {
    
    return self.frame.size.height;
    
}

- (void)setX:(float)x {
    
    CGRect viewFrame = self.frame;
    viewFrame.origin.x = x;
    self.frame = viewFrame;
    
}

- (void)setY:(float)y {
    
    CGRect viewFrame = self.frame;
    viewFrame.origin.y = y;
    self.frame = viewFrame;
    
}

- (void)setWidth:(float)width {
    
    CGRect viewFrame = self.frame;
    viewFrame.size.width = width;
    self.frame = viewFrame;
    
}

- (void)setHeight:(float)height {
    
    CGRect viewFrame = self.frame;
    viewFrame.size.height = height;
    self.frame = viewFrame;
    
}

@end
