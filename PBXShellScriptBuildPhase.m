//
//  PBXShellScriptBuildPhase.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXShellScriptBuildPhase.h"


@implementation PBXShellScriptBuildPhase
@synthesize inputPaths;
@synthesize name;
@synthesize outputPaths;
@synthesize shellPath;
@synthesize shellScript;
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 inputPaths, @"inputPaths",
								 name, @"name",
								 outputPaths, @"outputPaths",
								 shellPath, @"shellPath",
								 shellScript, @"shellScript", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
