//
//  PBXProject.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@class XCConfigurationList, PBXGroup;

@interface PBXProject : XcodeObject {
	NSString *buildConfigurationList;
	NSString *compatibilityVersion;
	NSNumber *hasScannedForEncodings;
	NSString *mainGroup;
	NSString *productRefGroup;
	NSString *projectDirPath;
	NSString *projectRoot;
	NSArray *targets;
	NSString *sourceFileName;
}
- (XCConfigurationList *)buildConfigurationList;
- (void)setBuildConfigurationList:(NSString *)newList;
@property(retain) NSString *compatibilityVersion;
@property(retain) NSNumber *hasScannedForEncodings;
- (PBXGroup *)mainGroup;
- (void)setMainGroup:(NSString *)newGroup;
- (PBXGroup *)productRefGroup;
- (void)setProductRefGroup:(NSString *)newGroup;
@property(retain) NSString *projectDirPath;
@property(retain) NSString *projectRoot;
@property(retain) NSArray *targets;
@property(retain) NSString *sourceFileName;
@end
