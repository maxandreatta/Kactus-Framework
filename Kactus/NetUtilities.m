//
//  NetUtilities.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 22/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>
#import <netinet/in.h>

#include "NetUtilities.h"

NSString* HostGetName()
{
    char baseHostName[256]; // Thanks, Gunnar Larisch
    int success = gethostname(baseHostName, 255);
    if (success != 0) return nil;
    baseHostName[255] = '\0';
    return [NSString stringWithCString:baseHostName encoding:NSUTF8StringEncoding];
}

NSString* SockaddrToString(const struct sockaddr* address)
{
    if(address && address->sa_family == AF_INET) {
        const struct sockaddr_in* sin = (struct sockaddr_in*) address;
        return [NSString stringWithFormat:@"%@:%d", [NSString stringWithUTF8String:inet_ntoa(sin->sin_addr)], ntohs(sin->sin_port)];
    }
    
    return nil;
}