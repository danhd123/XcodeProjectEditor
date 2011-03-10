//
//  XCBuildConfiguration.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"


@interface XCBuildConfiguration : XcodeObject {
	NSDictionary *buildSettings;
	NSString *name;
}
@property(retain) NSDictionary *buildSettings;
@property(retain) NSString *name;
@end
