//
//  SYPBXProjPaths.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYPBXProjPaths.h"
//#import "RegexKitLite.h"


@implementation SYPBXProjPaths
+(NSString *)projectFileAt:(NSString *)basePath
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
    NSError *error = nil;
    NSRegularExpression *xcodeprojRE = [[NSRegularExpression alloc] initWithPattern:@"\\.xcodeproj$" options:0 error:&error];
    if (error) {
        NSLog(@"error compiling .xcodeproj$ regex");
        return nil;
    }
    if ([xcodeprojRE numberOfMatchesInString:path options:0 range:NSMakeRange(0, [path length])] == 0)
//	if (![path isMatchedByRegex:@"\\.xcodeproj$"])
	{
		path = [path stringByAppendingString:@".xcodeproj"];
	}
	if ([[NSFileManager defaultManager] fileExistsAtPath:path])
	{
		return [path stringByAppendingPathComponent:pbxfile];
	}
    NSError *directoryContentsError = nil;
    NSArray *entries = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:basePath error:&directoryContentsError];
    if (directoryContentsError) {
        return nil;
    }
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
        NSRegularExpression *pbxprojRE = [[NSRegularExpression alloc] initWithPattern:@"\\.pbxproj$" options:0 error:&error];
        if (error) {
            NSLog(@"error compiling .pbxproj$ regex");
            return nil;
        }
        if ([pbxprojRE numberOfMatchesInString:path options:0 range:NSMakeRange(0, [path length])] == 0)
//		if ([entry isMatchedByRegex:@"\\.pbxproj$"])
		{
			return path;
		}
        else if ([xcodeprojRE numberOfMatchesInString:path options:0 range:NSMakeRange(0, [path length])])
//		else if ([entry isMatchedByRegex:@"\\.xcodeproj$"])
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
+(NSString *)projectRootAt:(NSString *)basePath
{
	NSString *file = [self projectFileAt:basePath];
	return [[file stringByDeletingLastPathComponent] stringByDeletingLastPathComponent];
}
@end
