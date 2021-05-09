//
//  PBXContainerItemProxy.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class PBXProject;

@interface PBXContainerItemProxy : XcodeObject
-(PBXProject *)containerPortal;
-(void)setContainerPortal:(NSString *)contPort;
@property(strong) NSNumber *proxyType;
@property(copy) NSString *remoteGlobalIDString;
@property(strong) NSString *remoteInfo;
@end
