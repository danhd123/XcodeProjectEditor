//
//  PBXProject.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXProject.h"
#import "XCConfigurationList.h"
#import "PBXGroup.h"
#import "SYPBXProjArchiver.h"

@implementation PBXProject {
    NSString *_buildConfigurationList;
    NSString *_mainGroup;
    NSString *_productRefGroup;
}
- (XCConfigurationList *)buildConfigurationList
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_buildConfigurationList];
}
- (void)setBuildConfigurationList:(NSString *)newList
{
	_buildConfigurationList = newList;
}
- (PBXGroup *)mainGroup
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_mainGroup];
}
- (void)setMainGroup:(NSString *)newGroup
{
	_mainGroup = newGroup;
}
- (PBXGroup *)productRefGroup
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_productRefGroup];
}
- (void)setProductRefGroup:(NSString *)newGroup
{
	_productRefGroup = newGroup;
}
- (NSArray *)targets
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[_targets count]];
	for (NSString *target in _targets)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:target]];
	}
	return ret;	
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _buildConfigurationList, @"buildConfigurationList", 
								   _compatibilityVersion, @"compatabilityVersion",
								 _hasScannedForEncodings, @"hasScannedForEncodings",
											  _mainGroup, @"mainGroup",
										 _projectDirPath, @"projectDirPath",
											_projectRoot, @"projectRoot",
												_targets, @"targets", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
