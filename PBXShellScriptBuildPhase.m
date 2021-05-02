//
//  PBXShellScriptBuildPhase.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXShellScriptBuildPhase.h"


@implementation PBXShellScriptBuildPhase
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _inputPaths, @"inputPaths",
                                 _inputFileListPaths, @"inputFileListPaths",
								 _name, @"name",
								 _outputPaths, @"outputPaths",
                                 _outputFileListPaths, @"outputFileListPaths",
								 _shellPath, @"shellPath",
								 _shellScript, @"shellScript",
                                 _showEnvVarsInLog, @"showEnvVarsInLog", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
