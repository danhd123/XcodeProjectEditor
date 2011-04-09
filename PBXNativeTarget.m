//
//  PBXNativeTarget.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXNativeTarget.h"
#import "XCConfigurationList.h"
#import "PBXFileReference.h"
#import "SYPBXProjArchiver.h"

@implementation PBXNativeTarget
@synthesize buildPhases;
@synthesize buildRules;
@synthesize dependencies;
@synthesize name;
@synthesize productInstallPath;
@synthesize productName;
@synthesize productType;
-(void)dealloc
{
	SYRelease(buildRules);
	SYRelease(buildPhases);
	SYRelease(dependencies);
	SYRelease(name);
	SYRelease(productName);
	SYRelease(productInstallPath);
	SYRelease(productType);
	SYRelease(productReference);
	SYRelease(buildConfigurationList);
	[super dealloc];
}
- (NSArray *)buildPhases
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[buildPhases count]];
	for (NSString *phase in buildPhases)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:phase]];
	}
	return ret;
}
- (PBXFileReference *)productReference
{
	return [self.archiver.objectsByArchiveIDs objectForKey:productReference];
}
- (void)setProductReference:(NSString *)newReference
{
	[newReference retain];
	[productReference release];
	newReference = productReference;
}
//TODO: check if I need to do the same with Build Rules and Dependencies
// probably (I don't see a PBXBuildRule though)
- (XCConfigurationList *)buildConfigurationList
{
	return [self.archiver.objectsByArchiveIDs objectForKey:buildConfigurationList];
}
- (void)setBuildConfigurationList:(NSString *)newList
{
	[newList retain];
	[buildConfigurationList release];
	buildConfigurationList = newList;
}
-(NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 buildConfigurationList, @"buildConfigurationList", 
											 buildPhases, @"buildPhases", 
											 buildRules, @"buildRules",
											dependencies, @"dependencies",
												   name, @"name",
									 productInstallPath, @"productInstallPath",
											productName, @"productName",
									   productReference, @"productReference",
											productType, @"productType", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
