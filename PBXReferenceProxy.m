//
//  PBXReferenceProxy.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXReferenceProxy.h"
#import "SYPBXProjArchiver.h"


@implementation PBXReferenceProxy {
    NSString *_remoteRef;
}
- (PBXContainerItemProxy *)remoteRef
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_remoteRef];
}
- (void)setRemoteRef:(NSString *)newRemoteRef
{
	_remoteRef = newRemoteRef;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _fileType, @"fileType",
								 _path, @"path",
								 _remoteRef, @"remoteRef",
								 _sourceTree, @"sourceTree", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
