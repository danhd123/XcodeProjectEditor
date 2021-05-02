//
//  XCVersionGroup.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface XCVersionGroup : XcodeObject
@property(copy) NSArray *children;
@property(copy) NSString *path;
@property(copy) NSString *sourceTree;
@property(copy) NSString *versionGroupType;
@end
