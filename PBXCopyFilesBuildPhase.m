//
//  PBXCopyFilesBuildPhase.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/8/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXCopyFilesBuildPhase.h"


@implementation PBXCopyFilesBuildPhase
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _dstPath, @"dstPath",
								 _dstSubfolderSpec, @"dstSubfolderSpec", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
