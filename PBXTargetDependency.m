//
//  PBXTargetDependency.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXTargetDependency.h"
#import "PBXContainerItemProxy.h"

@implementation PBXTargetDependency
@synthesize name;
@synthesize targetProxy;
-(NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:name, @"name", targetProxy, @"targetProxy", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
