//
//  NSString+LeftPadding.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 11/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "NSString+LeftPadding.h"

@implementation NSString (LeftPadding)

- (NSString *) stringByPaddingTheLeftToLength:(NSUInteger) newLength withString:(NSString *) padString startingAtIndex:(NSUInteger) padIndex
{
    if ([self length] <= newLength)
        return [[@"" stringByPaddingToLength:newLength - [self length] withString:padString startingAtIndex:padIndex] stringByAppendingString:self];
    else
        return [self copy];
}

@end
