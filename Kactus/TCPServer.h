//
//  TCPServer.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 22/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "TCPService.h"
#import "TCPConnection.h"

@class TCPServer, TCPServerConnection;

@protocol TCPServerDelegate <NSObject>
@optional
- (void) serverDidStart:(TCPServer*)server;
- (void) serverDidEnableBonjour:(TCPServer*)server withName:(NSString*)name;
- (void) server:(TCPServer*)server didNotEnableBonjour:(NSDictionary *)errorDict;

- (BOOL) server:(TCPServer*)server shouldAcceptConnectionFromAddress:(const struct sockaddr*)address;
- (void) server:(TCPServer*)server didOpenConnection:(TCPServerConnection*)connection; //From this method, you typically set the delegate of the connection to be able to send & receive data through it
- (void) server:(TCPServer*)server didCloseConnection:(TCPServerConnection*)connection;

- (void) serverWillDisableBonjour:(TCPServer*)server;
- (void) serverWillStop:(TCPServer*)server;
@end

@interface TCPServer : TCPService
{
@private
    NSMutableSet*                _connections;
    id<TCPServerDelegate>        _delegate;
    NSUInteger                    _delegateMethods;
}
+ (Class) connectionClass; //Must be a subclass of "TCPServerConnection"

@property(readonly) NSArray* allConnections;

@property(assign) id<TCPServerDelegate> delegate;
@end

@interface TCPServerConnection : TCPConnection
{
@private
    TCPServer*            _server; //Not retained
}
@property(readonly) TCPServer* server;
@end