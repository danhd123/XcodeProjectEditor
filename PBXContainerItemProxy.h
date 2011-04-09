//
//  PBXContainerItemProxy.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@class PBXProject;

@interface PBXContainerItemProxy : XcodeObject {
	NSString *containerPortal;
	NSNumber *proxyType;
	NSString *remoteGlobalIDString;
	NSString *remoteInfo;
}
-(PBXProject *)containerPortal;
-(void)setContainerPortal:(NSString *)contPort;
@property(retain) NSNumber *proxyType;
@property(retain) NSString *remoteGlobalIDString;
@property(retain) NSString *remoteInfo;
@end
