//
//  PBXBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface PBXBuildPhase : XcodeObject {
	NSNumber *buildActionMask;
	NSArray *files; //PBXBuildFiles
	NSNumber *runOnlyForDeploymentPostprocessing;

}
@property(retain) NSNumber *buildActionMask;
@property(nonatomic, retain) NSArray *files;
@property(retain) NSNumber *runOnlyForDeploymentPostprocessing;

@end
