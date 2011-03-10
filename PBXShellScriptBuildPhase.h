//
//  PBXShellScriptBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PBXBuildPhase.h"

@interface PBXShellScriptBuildPhase : PBXBuildPhase {
	NSArray *inputPaths;
	NSString *name;
	NSArray *outputPaths;
	NSString *shellPath;
	NSString *shellScript;
}
@property(retain) NSArray *inputPaths;
@property(retain) NSString *name;
@property(retain) NSArray *outputPaths;
@property(retain) NSString *shellPath;
@property(retain) NSString *shellScript;
@end
