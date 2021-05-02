//
//  SYXCProjFileUtils.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 5/5/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYXCProjFileUtils.h"
#import "SYPBXProjPaths.h"
#import "SYPBXProjArchiver.h"
#import "SYPBXProjEncoder.h"
#import "PBXProject.h"

static SYXCProjFileUtils *sSharedUtils;

@implementation SYXCProjFileUtils
+ (id)sharedUtils
{
	if (sSharedUtils == nil)
	{
		sSharedUtils = [[SYXCProjFileUtils alloc] init];
	}
	return sSharedUtils;
}
- (id)init
{
	if (sSharedUtils)
		return sSharedUtils;
	self = [super init];
	if (self != nil) {
		sSharedUtils = self;
	}
	return self;
}

+ (SYPBXProjArchiver *)loadProjectAt:(NSString *)path
{
	NSString *file = [SYPBXProjPaths projectFileAt:path];
	SYPBXProjArchiver *projectArchiver = [SYPBXProjArchiver newUnarchiverWithFile:file];
//	PBXProject *project = [projectArchiver unarchive];
//	project.sourceFileName = file;
	//Client code should call these methods; own the archiver. 
	return projectArchiver;
}
+ (void)dumpProjectArchiver:(SYPBXProjArchiver *)project atPath:(NSString *)path
{
	NSString *file = [SYPBXProjPaths projectFileAt:path];
	NSDictionary *contents = [project archiveToHash];
	NSString *fileContents = [SYPBXProjEncoder encode:contents];
	NSError *err = nil;
	[fileContents writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:&err];
	if (err)
	{
		NSLog(@"%@", err);
	}
}

@end
