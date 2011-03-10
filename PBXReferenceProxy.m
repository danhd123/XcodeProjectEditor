//
//  PBXReferenceProxy.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXReferenceProxy.h"


@implementation PBXReferenceProxy
@synthesize fileType;
@synthesize path;
@synthesize remoteRef;
@synthesize sourceTree;
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
