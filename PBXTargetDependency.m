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

@implementation PBXTargetDependency {
    NSString *_targetProxy;
    NSString *_target;
}
-(PBXContainerItemProxy *)targetProxy
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_targetProxy];
}
-(void)setTargetProxy:(NSString *)tp
{
	_targetProxy = tp;
}
-(PBXNativeTarget *)target
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_target];
}
-(void)setTarget:(NSString *)t
{
	_target = t;
}

-(NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:_name, @"name", _targetProxy, @"targetProxy", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
