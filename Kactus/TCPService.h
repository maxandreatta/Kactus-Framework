//
//  TCPService.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 22/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/socket.h>

@interface TCPService : NSObject
{
@private
    UInt16                _port;
    
    NSRunLoop*            _runLoop;
    CFSocketRef            _ipv4Socket;
    NSNetService*        _netService;
    BOOL                _running;
    struct sockaddr*    _localAddress;
}
- (id) initWithPort:(UInt16)port; //Pass 0 to have a port automatically be chosen

- (BOOL) startUsingRunLoop:(NSRunLoop*)runLoop;
@property(readonly, getter=isRunning) BOOL running;
- (void) stop;

@property(readonly) UInt16 localPort; //Only valid when running
@property(readonly) UInt32 localIPv4Address; //Only valid when running - opaque (not an integer)

- (BOOL) enableBonjourWithDomain:(NSString*)domain applicationProtocol:(NSString*)protocol name:(NSString*)name; //Pass "nil" for the default local domain - Pass only the application protocol for "protocol" e.g. "myApp"
@property(readonly, getter=isBonjourEnabled) BOOL bonjourEnabled;
- (void) disableBonjour;

- (void) handleNewConnectionWithSocket:(NSSocketNativeHandle)socket fromRemoteAddress:(const struct sockaddr*)address; //To be implemented by subclasses
@end