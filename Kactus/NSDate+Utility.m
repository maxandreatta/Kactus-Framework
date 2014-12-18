//
//  NSDate+Utility.m
//  Kactus
//
//  Created by Federico Polesello on 18/12/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "NSDate+Utility.h"

@implementation NSDate (Utility)

+ (NSDate*)getDateFromString:(NSString*)strDate withInputDateFormat:(NSString*)inputDateFormat {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:inputDateFormat];
    NSDate *objdate = [dateFormat dateFromString:strDate];
    return objdate;
    
}

+ (NSString*)getStringFromDate:(NSDate*)objDate andOutputDateFormat:(NSString*)outputDateFormat {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:outputDateFormat];
    NSString *strDate = [dateFormat stringFromDate:objDate];
    return strDate;
    
}

@end
