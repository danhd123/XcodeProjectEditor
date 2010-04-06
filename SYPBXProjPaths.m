//
//  SYPBXProjPaths.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYPBXProjPaths.h"
#import "RegexKitLite.h"


@implementation SYPBXProjPaths
-(NSString *)projectFileAt:(NSString *)basePath
{
	BOOL exists, isDirectory;
	exists = [[NSFileManager defaultManager] fileExistsAtPath:basePath isDirectory:&isDirectory];
	if (exists && !isDirectory)
	{
		return basePath;
	}
	NSString *pbxfile = @"project.pbxproj";
	NSString *path = basePath;
	if ([[path substringWithRange:NSMakeRange([path length]-1, 1)] isEqualToString:@"/"] || [[path substringWithRange:NSMakeRange([path length]-1, 1)] isEqualToString:@"\\"])
	{
		path = [path substringToIndex:[path length]-2];
	}
	if (![path isMatchedByRegex:@"/\\.xcodeproj$"])
	{
		path = [path stringByAppendingString:@".xcodeproj"];
	}
	if ([[NSFileManager defaultManager] fileExistsAtPath:path])
	{
		return [path stringByAppendingPathComponent:pbxfile];
	}
	NSArray *entries = [[NSFileManager defaultManager] directoryContentsAtPath:basePath];
	NSMutableArray *existingEntries = [NSMutableArray array];
	for (NSString *entry in entries)
	{
		if ([[NSFileManager defaultManager] fileExistsAtPath:[basePath stringByAppendingPathComponent:entry]])
		{
			[existingEntries addObject:entry];
		}
	}
	for (NSString *entry in existingEntries)
	{
		if ([entry isEqualToString:@".."])
		{
			continue;
		}
		path = [basePath stringByAppendingPathComponent:entry];
		if ([entry isMatchedByRegex:@"\\.pbxproj$"])
		{
			return path;
		}
		else if ([entry isMatchedByRegex:@"\\.xcodeproj$"])
		{
			return [path stringByAppendingPathComponent:pbxfile];
		}
		else
		{
			exists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
			if (isDirectory && [[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingPathComponent:pbxfile]])
			{
				return [path stringByAppendingPathComponent:pbxfile];
			}
		}
	}
	NSLog(@"Could not find Xcode project at %@", basePath);
	return nil;
}
-(NSString *)projectRootAt:(NSString *)basePath
{
	NSString *file = [self projectFileAt:basePath];
	return [[file stringByDeletingLastPathComponent] stringByDeletingLastPathComponent];
}
@end
