//
//  PBXNativeTarget.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@class XCConfigurationList, PBXFileReference;

@interface PBXNativeTarget : XcodeObject {
	NSString *buildConfigurationList;
	NSArray *buildPhases;
	NSArray *buildRules;
	NSArray *dependecies;
	NSString *name;
	NSString *productInstallPath;
	NSString *productName;
	NSString *productReference;
	NSString *productType;
}
- (XCConfigurationList *)buildConfigurationList;
- (void)setBuildConfigurationList:(NSString *)newList;
@property(retain) NSArray *buildPhases;
@property(retain) NSArray *buildRules;
@property(retain) NSArray *dependecies;
@property(retain) NSString *name;
@property(retain) NSString *productInstallPath;
@property(retain) NSString *productName;
- (PBXFileReference *)productReference;
- (void)setProductReference:(NSString *)newReference;
@property(retain) NSString *productType;
@end
