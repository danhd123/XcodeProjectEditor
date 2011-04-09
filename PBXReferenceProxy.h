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
	NSString *remoteRef;
	NSString *sourceTree;
}
@property(retain) NSString *fileType;
@property(retain) NSString *path;
-(PBXContainerItemProxy *)remoteRef;
-(void)setRemoteRef:(NSString *)newRemoteRef;
@property(retain) NSString *sourceTree;
@end
