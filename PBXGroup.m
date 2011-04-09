//
//  PBXGroup.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXGroup.h"
#import "SYPBXProjArchiver.h"

@implementation PBXGroup
@synthesize children;
@synthesize name;
@synthesize sourceTree;
- (void)dealloc
{
	SYRelease(children);
	SYRelease(name);
	SYRelease(sourceTree);
	[super dealloc];
}
- (NSArray *)children
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[children count]];
	for (NSString *child in children)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:child]];
	}
	return ret;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								   children, @"children",
									   name, @"name",
								 sourceTree, @"sourceTree", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
