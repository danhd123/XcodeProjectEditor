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
@synthesize buildConfigurations;
@synthesize defaultConfigurationIsVisible;
@synthesize defaultConfigurationName;
- (void)dealloc
{
	SYRelease(buildConfigurations);
	SYRelease(defaultConfigurationName);
	SYRelease(defaultConfigurationIsVisible);
	[super dealloc];
}
- (NSArray *)buildConfigurations
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[buildConfigurations count]];
	for (NSString *conf in buildConfigurations)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:conf]];
	}
	return ret;	
}

- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:buildConfigurations, @"buildConfigurations", defaultConfigurationIsVisible, "defaultConfigurationIsVisible", defaultConfigurationName, @"defaultConfigurationName", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
