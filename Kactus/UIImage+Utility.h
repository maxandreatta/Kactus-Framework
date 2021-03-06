//
//  UIImage+Utility.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 15/07/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

#define TMP NSTemporaryDirectory()

+ (UIImage *) imageWithView:(UIView *)view;
+ (NSString *) contentTypeForImageData:(NSData *)data;
+ (UIImage *) imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIImage *) imageFromColor:(UIColor *)color;
+ (UIImage *) image:(UIImage *)image withMaskColor:(UIColor *)color;
+ (UIImage *) tinteggia: (UIImage *)image rosso:(float)r verde:(float)g blu:(float)b alpha:(float)a NS_DEPRECATED_IOS(3_0, 7_0, "Use tinteggia:fromColor:withAlpha instead");
+ (UIImage*)tinteggia:(UIImage *)image fromColor:(UIColor*)colorReceveid withAlpha:(CGFloat)a;
+ (void) cacheImage: (NSString *) ImageURLString;
+ (UIImage *) getCachedImage: (NSString *) ImageURLString;
+ (UIImage *) convertBitmapRGBA24ToUIImage:(unsigned char *) bits withSize: (CGSize) size;

@end
