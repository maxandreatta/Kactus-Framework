//
//  UILabel(VAlign).m
//  nordica
//
//  Created by Andreatta Massimiliano on 06/11/12.
//  Copyright (c) 2012 MAPOSTUDIO. All rights reserved.
//

// UILabel(VAlign).m
#import "UILabel+VAlign.h"

@implementation UILabel (VAlign)

- (void) setVerticalAlignmentTop
{
    CGSize textSize = [self.text sizeWithFont:self.font
                            constrainedToSize:self.frame.size
                                lineBreakMode:self.lineBreakMode];
    
    CGRect textRect = CGRectMake(self.frame.origin.x,
                                 self.frame.origin.y,
                                 self.frame.size.width,
                                 textSize.height);
    [self setFrame:textRect];
    [self setNeedsDisplay];
}

@end