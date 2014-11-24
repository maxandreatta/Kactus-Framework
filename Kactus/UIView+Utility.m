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

@end
