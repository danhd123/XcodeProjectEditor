//
//  PBXTargetDependency.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXTargetDependency.h"
#import "PBXContainerItemProxy.h"
#import "SYPBXProjArchiver.h"

@implementation PBXTargetDependency
@synthesize name;
-(PBXContainerItemProxy *)targetProxy
{
	return [self.archiver.objectsByArchiveIDs objectForKey:targetProxy];
}
-(void)setTargetProxy:(NSString *)tp
{
	targetProxy = tp;
}
-(PBXNativeTarget *)target
{
	return [self.archiver.objectsByArchiveIDs objectForKey:target];
}
-(void)setTarget:(NSString *)t
{
	target = t;
}

-(NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:name, @"name", targetProxy, @"targetProxy", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
