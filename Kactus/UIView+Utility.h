//
//  UIView+Utility.h
//  Kactus
//
//  Created by Federico Polesello on 24/11/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utility)

- (void)addBorderWithColor:(UIColor*)color andWidth:(CGFloat)width andCornerRadius:(CGFloat)cornerRadius;
- (void)removeBorder;

@end
