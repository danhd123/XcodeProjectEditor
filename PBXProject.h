//
//  PBXProject.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class XCConfigurationList, PBXGroup;

@interface PBXProject : XcodeObject
@property (copy) NSDictionary *attributes;
- (XCConfigurationList *)buildConfigurationList;
- (void)setBuildConfigurationList:(NSString *)newList;
@property(copy) NSString *compatibilityVersion;
@property(copy) NSString *developmentRegion;
@property(strong) NSNumber *hasScannedForEncodings;
@property(copy) NSArray <NSString *> *knownRegions;
- (PBXGroup *)mainGroup;
- (void)setMainGroup:(NSString *)newGroup;
- (PBXGroup *)productRefGroup;
- (void)setProductRefGroup:(NSString *)newGroup;
@property(copy) NSString *projectDirPath;
@property(copy) NSString *projectRoot;
@property(nonatomic, copy) NSArray *targets;
@property(copy) NSString *sourceFileName;
@end
