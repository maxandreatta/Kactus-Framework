//
//  Networking_Internal.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 22/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "TCPConnection.h"

#define REPORT_ERROR(__FORMAT__, ...) printf("%s: %s\n", __FUNCTION__, [[NSString stringWithFormat:__FORMAT__, __VA_ARGS__] UTF8String])

#ifndef __DELEGATE_IVAR__
#define __DELEGATE_IVAR__ _delegate
#endif
#ifndef __DELEGATE_METHODS_IVAR__
#define __DELEGATE_METHODS_IVAR__ _delegateMethods
#endif
#define TEST_DELEGATE_METHOD_BIT(__BIT__) (self->__DELEGATE_METHODS_IVAR__ & (1 << __BIT__))
#define SET_DELEGATE_METHOD_BIT(__BIT__, __NAME__) { if([self->__DELEGATE_IVAR__ respondsToSelector:@selector(__NAME__)]) self->__DELEGATE_METHODS_IVAR__ |= (1 << __BIT__); else self->__DELEGATE_METHODS_IVAR__ &= ~(1 << __BIT__); }

@interface TCPConnection ()
- (void) _invalidate;
@end