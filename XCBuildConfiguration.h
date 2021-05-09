//
//  XCBuildConfiguration.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class PBXFileReference;

@interface XCBuildConfiguration : XcodeObject
@property(copy) NSDictionary *buildSettings;
@property(copy) NSString *name;
- (void)setBaseConfigurationReference:(NSString *)baseConfigurationReference;
- (PBXFileReference *)baseConfigurationReference;
@end
