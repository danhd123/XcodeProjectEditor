//
//  PBXContainerItemProxy.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface PBXContainerItemProxy : XcodeObject {
	id containerPortal; //TODO: find out what this is!
	NSNumber *proxyType;
	NSString *remoteGlobalIDString;
	NSString *remoteInfo;
}
@property(retain) id containerPortal;
@property(retain) NSNumber *proxyType;
@property(retain) NSString *remoteGlobalIDString;
@property(retain) NSString *remoteInfo;
@end
