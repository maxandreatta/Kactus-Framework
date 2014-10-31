//
//  NSThread+ManyObjects.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 25/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "NSThread+ManyObjects.h"

@implementation NSThread (ManyObjects)

+ (void)detachNewThreadSelector:(SEL)aSelector
                       toTarget:(id)aTarget
                     withObject:(id)anArgument
                      andObject:(id)anotherArgument
{
    NSMethodSignature *signature = [aTarget methodSignatureForSelector:aSelector];
    if (!signature) return;
    
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:aTarget];
    [invocation setSelector:aSelector];
    [invocation setArgument:&anArgument atIndex:2];
    [invocation setArgument:&anotherArgument atIndex:3];
    [invocation retainArguments];
    
    [self detachNewThreadSelector:@selector(invoke) toTarget:invocation withObject:nil];
}

@end
