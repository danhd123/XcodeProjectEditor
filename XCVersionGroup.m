//
//  XCVersionGroup.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XCVersionGroup.h"


@implementation XCVersionGroup
@synthesize children;
@synthesize path;
@synthesize sourceTree;
@synthesize versionGroupType;
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 children, @"children",
								 path, @"path",
								 sourceTree, @"sourceTree",
								 versionGroupType, @"versionGroupType", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
