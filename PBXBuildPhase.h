//
//  PBXBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@interface PBXBuildPhase : XcodeObject
@property(strong) NSNumber *buildActionMask;
@property(nonatomic, copy) NSArray *files;
@property(strong) NSNumber *runOnlyForDeploymentPostprocessing; // these should really probably be scalars.

@end
