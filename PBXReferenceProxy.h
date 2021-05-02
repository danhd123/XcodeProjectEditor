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

@interface PBXReferenceProxy : XcodeObject 
@property(copy) NSString *fileType;
@property(copy) NSString *path;
- (PBXContainerItemProxy *)remoteRef;
- (void)setRemoteRef:(NSString *)newRemoteRef;
@property(copy) NSString *sourceTree;
@end
