//
//  SYXCConfigurationList.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XCConfigurationList.h"
#import "SYPBXProjArchiver.h"

@implementation XCConfigurationList
- (NSArray *)buildConfigurations
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[_buildConfigurations count]];
	for (NSString *conf in _buildConfigurations)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:conf]];
	}
	return ret;	
}

- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:_buildConfigurations, @"buildConfigurations", _defaultConfigurationIsVisible, "defaultConfigurationIsVisible", _defaultConfigurationName, @"defaultConfigurationName", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
