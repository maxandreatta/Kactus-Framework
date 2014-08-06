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

+ (NSString *)contentTypeForImageData:(NSData *)data;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIImage *) imageFromColor:(UIColor *)color;
+ (UIImage *) image:(UIImage *)image withMaskColor:(UIColor *)color;
+ (UIImage *) tinteggia: (UIImage *)image rosso:(float)r verde:(float)g blu:(float)b alpha:(float)a;
+ (void) cacheImage: (NSString *) ImageURLString;
+ (UIImage *) getCachedImage: (NSString *) ImageURLString;


@end
