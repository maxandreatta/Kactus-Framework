//
//  UIColor+Utility.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 15/07/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utility)

+ (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color;
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert alpha:(float)alpha;

@end
