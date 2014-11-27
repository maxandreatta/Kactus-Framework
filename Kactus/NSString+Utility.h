//
//  NSString+SHA512.h
//  TVSC
//
//  Created by Andreatta Massimiliano on 03/01/14.
//
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonDigest.h>

@interface NSString (Utility)

+ (NSString *) createSHA512:(NSString *)source;
- (NSString *) MD5;
- (NSString *) base64String;

@end
