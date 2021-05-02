//
//  XCVersionGroup.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XCVersionGroup.h"


@implementation XCVersionGroup
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _children, @"children",
								 _path, @"path",
								 _sourceTree, @"sourceTree",
								 _versionGroupType, @"versionGroupType", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
