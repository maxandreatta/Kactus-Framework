//
//  NSString+LeftPadding.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 11/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LeftPadding)

- (NSString *) stringByPaddingTheLeftToLength:(NSUInteger) newLength withString:(NSString *) padString startingAtIndex:(NSUInteger) padIndex;

@end
