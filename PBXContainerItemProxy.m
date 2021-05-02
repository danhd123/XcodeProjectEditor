//
//  PBXContainerItemProxy.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXContainerItemProxy.h"
#import "SYPBXProjArchiver.h"


@implementation PBXContainerItemProxy {
    NSString *_containerPortal;
}
- (PBXProject *)containerPortal
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_containerPortal];
}
- (void)setContainerPortal:(NSString *)contPort
{
	_containerPortal = contPort;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _containerPortal, @"containerPortal",
									   _proxyType, @"proxyType",
							_remoteGlobalIDString, @"remoteGlobalIDString",
									  _remoteInfo, @"remoteInfo", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
