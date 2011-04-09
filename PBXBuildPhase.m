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
@synthesize buildActionMask;
@synthesize files;
@synthesize runOnlyForDeploymentPostprocessing;
-(void)dealloc
{
	SYRelease(buildActionMask);
	SYRelease(files);
	SYRelease(runOnlyForDeploymentPostprocessing);
	[super dealloc];
}
- (NSArray *)files
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[files count]];
	for (NSString *file in files)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:file]];
	}
	return ret;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 buildActionMask, @"buildActionMask",
								 files, @"files",
								 runOnlyForDeploymentPostprocessing, @"runOnlyForDeploymentPostprocessing", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
