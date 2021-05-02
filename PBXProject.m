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

@implementation PBXProject
@synthesize compatibilityVersion;
@synthesize hasScannedForEncodings;
@synthesize projectDirPath;
@synthesize projectRoot;
@synthesize targets;
@synthesize sourceFileName;
- (XCConfigurationList *)buildConfigurationList
{
	return [self.archiver.objectsByArchiveIDs objectForKey:buildConfigurationList];
}
- (void)setBuildConfigurationList:(NSString *)newList
{
	buildConfigurationList = newList;
}
- (PBXGroup *)mainGroup
{
	return [self.archiver.objectsByArchiveIDs objectForKey:mainGroup];
}
- (void)setMainGroup:(NSString *)newGroup
{
	mainGroup = newGroup;
}
- (PBXGroup *)productRefGroup
{
	return [self.archiver.objectsByArchiveIDs objectForKey:productRefGroup];
}
- (void)setProductRefGroup:(NSString *)newGroup
{
	productRefGroup = newGroup;
}
- (NSArray *)targets
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[targets count]];
	for (NSString *target in targets)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:target]];
	}
	return ret;	
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 buildConfigurationList, @"buildConfigurationList", 
								   compatibilityVersion, @"compatabilityVersion", 
								 hasScannedForEncodings, @"hasScannedForEncodings",
											  mainGroup, @"mainGroup",
										 projectDirPath, @"projectDirPath",
											projectRoot, @"projectRoot",
												targets, @"targets", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
