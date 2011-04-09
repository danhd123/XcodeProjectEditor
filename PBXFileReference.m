//
//  PBXFileReference.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXFileReference.h"


@implementation PBXFileReference
@synthesize fileEncoding;
@synthesize lastKnownFileType;
@synthesize name;
@synthesize path;
@synthesize sourceTree;
@synthesize explicitFileType;
@synthesize includeInIndex;
-(void)dealloc
{
	SYRelease(fileEncoding);
	SYRelease(lastKnownFileType);
	SYRelease(name);
	SYRelease(path);
	SYRelease(sourceTree);
	SYRelease(explicitFileType);
	SYRelease(includeInIndex);
	[super dealloc];
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	if (fileEncoding)
	{
		[dict setObject:fileEncoding forKey:@"fileEncoding"];
	}
	if (lastKnownFileType)
	{
		[dict setObject:lastKnownFileType forKey:@"lastKnownFileType"];
	}
	if (name)
	{
		[dict setObject:name forKey:@"name"];
	}
	if (path)
	{
		[dict setObject:path forKey:@"path"];
	}
	if (sourceTree)
	{
		[dict setObject:sourceTree forKey:@"sourceTree"];
	}
	if (explicitFileType)
	{
		[dict setObject:explicitFileType forKey:@"explicitFileType"];
	}
	if (includeInIndex)
	{
		[dict setObject:includeInIndex forKey:@"includeInIndex"];
	}
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
	//this is a somewhat longer implementation, because not all of these have to exist
}
@end
