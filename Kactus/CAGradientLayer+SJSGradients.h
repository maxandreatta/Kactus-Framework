//
//  CAGradientLayer+SJSGradients.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 16/07/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CAGradientLayer (SJSGradients)

+ (CAGradientLayer *)colorGradientLayerTopColor:(UIColor*)topColor bottomColor:(UIColor*)bottomColor;

@end
