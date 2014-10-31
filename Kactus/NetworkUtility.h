//
//  Network.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 24/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkUtility : NSObject

+ (NSArray *)addressesForHostname:(NSString *)hostname;

@end
