//
//  XCBuildConfiguration.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XCBuildConfiguration.h"


@implementation XCBuildConfiguration
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _buildSettings, @"buildSettings",
								 _name, @"name", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
