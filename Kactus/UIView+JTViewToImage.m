//
//  UIView+JTViewToImage.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 03/11/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "UIView+JTViewToImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (JTViewToImage)

static BOOL _supportDrawViewHierarchyInRect;

+ (void)load {
    if ([self instancesRespondToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        _supportDrawViewHierarchyInRect = YES;
    } else {
        _supportDrawViewHierarchyInRect = NO;
    }
}

- (UIImage *)toImage {
    return [self toImageWithScale:0];
}

- (UIImage *)toImageWithScale:(CGFloat)scale {
    UIImage *copied = [self toImageWithScale:scale legacy:NO];
    return copied;
}

- (UIImage *)toImageWithScale:(CGFloat)scale legacy:(BOOL)legacy {
    // If scale is 0, it'll follows the screen scale for creating the bounds
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, scale);
    
    if (legacy || ! _supportDrawViewHierarchyInRect) {
        // - [CALayer renderInContext:] also renders subviews
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    } else {
        [self drawViewHierarchyInRect:self.bounds
                   afterScreenUpdates:YES];
    }
    
    // Get the image out of the context
    UIImage *copied = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Return the result
    return copied;
}

@end