//
//  CAGradientLayer+SJSGradients.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 16/07/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "CAGradientLayer+SJSGradients.h"

@implementation CAGradientLayer (SJSGradients)

+ (CAGradientLayer *)colorGradientLayerTopColor:(UIColor*)topColor bottomColor:(UIColor*)bottomColor
{
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

@end
