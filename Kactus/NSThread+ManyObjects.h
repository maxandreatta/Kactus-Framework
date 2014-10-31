//
//  NSThread+ManyObjects.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 25/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (ManyObjects)

+ (void)detachNewThreadSelector:(SEL)aSelector
                       toTarget:(id)aTarget
                     withObject:(id)anArgument
                      andObject:(id)anotherArgument;

@end
