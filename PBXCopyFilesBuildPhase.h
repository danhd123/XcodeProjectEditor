//
//  PBXCopyFilesBuildPhase.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/8/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PBXBuildPhase.h"


@interface PBXCopyFilesBuildPhase : PBXBuildPhase {
	NSString *dstPath;
	NSNumber *dstSubfolderSpec;
}
@property(retain) NSString *dstPath;
@property(retain) NSNumber *dstSubfolderSpec;
@end
