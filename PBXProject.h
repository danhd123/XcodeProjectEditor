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

@interface PBXProject : XcodeObject
- (XCConfigurationList *)buildConfigurationList;
- (void)setBuildConfigurationList:(NSString *)newList;
@property(copy) NSString *compatibilityVersion;
@property(strong) NSNumber *hasScannedForEncodings;
- (PBXGroup *)mainGroup;
- (void)setMainGroup:(NSString *)newGroup;
- (PBXGroup *)productRefGroup;
- (void)setProductRefGroup:(NSString *)newGroup;
@property(copy) NSString *projectDirPath;
@property(copy) NSString *projectRoot;
@property(nonatomic, copy) NSArray *targets;
@property(copy) NSString *sourceFileName;
@end
