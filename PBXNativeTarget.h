//
//  PBXNativeTarget.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class XCConfigurationList, PBXFileReference;

@interface PBXNativeTarget : XcodeObject 
- (XCConfigurationList *)buildConfigurationList;
- (void)setBuildConfigurationList:(NSString *)newList;
@property(nonatomic, copy) NSArray *buildPhases;
@property(copy) NSArray *buildRules;
@property(copy) NSArray *dependencies;
@property(copy) NSString *name;
@property(copy) NSString *productInstallPath;
@property(copy) NSString *productName;
- (PBXFileReference *)productReference;
- (void)setProductReference:(NSString *)newReference;
@property(copy) NSString *productType;
@end
