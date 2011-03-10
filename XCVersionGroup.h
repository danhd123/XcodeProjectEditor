//
//  XCVersionGroup.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface XCVersionGroup : XcodeObject {
	NSArray *children;
	NSString *path;
	NSString *sourceTree;
	NSString *versionGroupType;
}
@property(retain) NSArray *children;
@property(retain) NSString *path;
@property(retain) NSString *sourceTree;
@property(retain) NSString *versionGroupType;
@end
