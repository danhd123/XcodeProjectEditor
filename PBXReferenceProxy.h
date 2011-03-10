//
//  PBXReferenceProxy.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@class PBXContainerItemProxy;

@interface PBXReferenceProxy : XcodeObject {
	NSString *fileType;
	NSString *path;
	PBXContainerItemProxy *remoteRef;
	NSString *sourceTree;
}
@property(retain) NSString *fileType;
@property(retain) NSString *path;
@property(retain) PBXContainerItemProxy *remoteRef;
@property(retain) NSString *sourceTree;
@end
