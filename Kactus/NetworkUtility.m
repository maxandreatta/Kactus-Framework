//
//  Network.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 24/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "NetworkUtility.h"

#import <netdb.h>
#import <arpa/inet.h>

@implementation NetworkUtility

+ (NSArray *)addressesForHostname:(NSString *)hostname
{
    const char* hostnameC = [hostname UTF8String];
    
    struct addrinfo hints, *res;
    struct sockaddr_in *s4;
    struct sockaddr_in6 *s6;
    int retval;
    char buf[64];
    NSMutableArray *result; //the array which will be return
    NSMutableArray *result4; //the array of IPv4, to order them at the end
    NSString *previousIP = nil;
    
    memset (&hints, 0, sizeof (struct addrinfo));
    hints.ai_family = PF_UNSPEC;//AF_INET6;
    hints.ai_flags = AI_CANONNAME;
    //AI_ADDRCONFIG, AI_ALL, AI_CANONNAME,	AI_NUMERICHOST
    //AI_NUMERICSERV, AI_PASSIVE, OR AI_V4MAPPED
    
    retval = getaddrinfo(hostnameC, NULL, &hints, &res);
    if (retval == 0)
    {
        if (res->ai_canonname)
        {
            result = [NSMutableArray arrayWithObject:[NSString stringWithUTF8String:res->ai_canonname]];
        }
        else
        {
            //it means the DNS didn't know this host
            return nil;
        }
        result4= [NSMutableArray array];
        while (res) {
            switch (res->ai_family){
                case AF_INET6:
                    s6 = (struct sockaddr_in6 *)res->ai_addr;
                    if(inet_ntop(res->ai_family, (void *)&(s6->sin6_addr), buf, sizeof(buf))
                       == NULL)
                    {
                        NSLog(@"inet_ntop failed for v6!\n");
                    }
                    else
                    {
                        //surprisingly every address is in double, let's add this test
                        if (![previousIP isEqualToString:[NSString stringWithUTF8String:buf]]) {
                            [result addObject:[NSString stringWithUTF8String:buf]];
                        }
                    }
                    break;
                    
                case AF_INET:
                    s4 = (struct sockaddr_in *)res->ai_addr;
                    if(inet_ntop(res->ai_family, (void *)&(s4->sin_addr), buf, sizeof(buf))
                       == NULL)
                    {
                        NSLog(@"inet_ntop failed for v4!\n");
                    }
                    else
                    {
                        //surprisingly every address is in double, let's add this test
                        if (![previousIP isEqualToString:[NSString stringWithUTF8String:buf]]) {
                            [result4 addObject:[NSString stringWithUTF8String:buf]];
                        }
                    }
                    break;
                default:
                    NSLog(@"Neither IPv4 nor IPv6!");
                    
            }
            //surprisingly every address is in double, let's add this test
            previousIP = [NSString stringWithUTF8String:buf];
            
            res = res->ai_next;
        }
    }else{
        NSLog(@"no IP found");
        return nil;
    }
    
    return [result arrayByAddingObjectsFromArray:result4];
}

@end
