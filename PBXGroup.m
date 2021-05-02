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
- (NSArray *)children
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[_children count]];
	for (NSString *child in _children)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:child]];
	}
	return ret;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								   _children, @"children",
									   _name, @"name",
								 _sourceTree, @"sourceTree",
                                  self.path, @"path", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
