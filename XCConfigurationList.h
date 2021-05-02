//
//  SYXCConfigurationList.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface XCConfigurationList : XcodeObject {
	NSArray *buildConfigurations; //of type XCBuildConfiguration
	NSNumber *defaultConfigurationIsVisible;
	NSString *defaultConfigurationName;
}
@property(nonatomic, retain) NSArray *buildConfigurations;
@property(retain) NSNumber *defaultConfigurationIsVisible;
@property(retain) NSString *defaultConfigurationName;

@end
