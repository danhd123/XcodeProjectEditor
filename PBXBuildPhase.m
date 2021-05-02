//
//  PBXBuildPhase.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXBuildPhase.h"
#import "SYPBXProjArchiver.h"


@implementation PBXBuildPhase
- (NSArray *)files
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[_files count]];
	for (NSString *file in _files)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:file]];
	}
	return ret;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _buildActionMask, @"buildActionMask",
								 _files, @"files",
								 _runOnlyForDeploymentPostprocessing, @"runOnlyForDeploymentPostprocessing", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
