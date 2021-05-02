//
//  PBXShellScriptBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PBXBuildPhase.h"

@interface PBXShellScriptBuildPhase : PBXBuildPhase
@property(copy) NSArray *inputPaths;
@property(copy) NSString *name;
@property(copy) NSArray *outputPaths;
@property(copy) NSString *shellPath;
@property(copy) NSString *shellScript;
@end
