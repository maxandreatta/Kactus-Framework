//
//  NSDate+Utility.h
//  Kactus
//
//  Created by Federico Polesello on 18/12/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utility)

+ (NSDate*)getDateFromString:(NSString*)strDate withInputDateFormat:(NSString*)inputDateFormat;
+ (NSString*)getStringFromDate:(NSDate*)objDate andOutputDateFormat:(NSString*)outputDateFormat;

@end
