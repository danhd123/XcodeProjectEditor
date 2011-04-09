//
//  XCBuildConfiguration.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XCBuildConfiguration.h"


@implementation XCBuildConfiguration
@synthesize buildSettings;
@synthesize name;
-(void)dealloc
{
	SYRelease(buildSettings);
	SYRelease(name);
	[super dealloc];
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 buildSettings, @"buildSettings",
								 name, @"name", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
