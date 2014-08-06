//
//  UILabelWithPadding.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 21/07/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "UILabelWithPadding.h"

@implementation UILabelWithPadding

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 20, 0, 5};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
