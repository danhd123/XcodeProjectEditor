//
//  PBXReferenceProxy.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXReferenceProxy.h"
#import "SYPBXProjArchiver.h"


@implementation PBXReferenceProxy
@synthesize fileType;
@synthesize path;
@synthesize sourceTree;
-(PBXContainerItemProxy *)remoteRef
{
	return [self.archiver.objectsByArchiveIDs objectForKey:remoteRef];
}
-(void)setRemoteRef:(NSString *)newRemoteRef
{
	[newRemoteRef retain];
	[remoteRef release];
	remoteRef = newRemoteRef;
}
- (void)dealloc
{
	SYRelease(fileType);
	SYRelease(path);
	SYRelease(sourceTree);
	SYRelease(remoteRef);
	[super dealloc];
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 fileType, @"fileType",
								 path, @"path", 
								 remoteRef, @"remoteRef",
								 sourceTree, @"sourceTree", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
