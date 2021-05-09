//
//  SYXCConfigurationList.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class XCBuildConfiguration;

@interface XCConfigurationList : XcodeObject
@property(nonatomic, copy) NSArray <XCBuildConfiguration *> *buildConfigurations;
@property(strong) NSNumber *defaultConfigurationIsVisible;
@property(copy) NSString *defaultConfigurationName;

@end
