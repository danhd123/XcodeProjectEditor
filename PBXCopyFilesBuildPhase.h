//
//  PBXCopyFilesBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/8/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBXBuildPhase.h"


@interface PBXCopyFilesBuildPhase : PBXBuildPhase
@property(copy) NSString *dstPath;
@property(strong) NSNumber *dstSubfolderSpec;
@property(copy) NSString *name;
@end
