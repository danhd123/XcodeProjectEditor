//
//  PBXShellScriptBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBXBuildPhase.h"

@interface PBXShellScriptBuildPhase : PBXBuildPhase
@property(copy) NSArray *inputPaths;
@property(copy) NSArray <NSString *> *inputFileListPaths;
@property(copy) NSString *name;
@property(copy) NSArray *outputPaths;
@property(copy) NSArray <NSString *> *outputFileListPaths;
@property(copy) NSString *shellPath;
@property(copy) NSString *shellScript;
@property(strong) NSNumber *showEnvVarsInLog;
@end
