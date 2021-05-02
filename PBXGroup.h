//
//  PBXGroup.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface PBXGroup : XcodeObject
@property(nonatomic, copy) NSArray *children;
@property(copy) NSString *name;
@property(copy) NSString *sourceTree;
@property(copy) NSString *path;
@end
