//
//  PBXContainerItemProxy.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXContainerItemProxy.h"


@implementation PBXContainerItemProxy
@synthesize containerPortal;
@synthesize proxyType;
@synthesize remoteGlobalIDString;
@synthesize remoteInfo;
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 containerPortal, @"containerPortal",
									   proxyType, @"proxyType",
							remoteGlobalIDString, @"remoteGlobalIDString",
									  remoteInfo, @"remoteInfo", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
