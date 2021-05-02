//
//  PBXFileReference.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"


@interface PBXFileReference : XcodeObject 
@property(strong) NSNumber *fileEncoding;
@property(copy) NSString *lastKnownFileType;
@property(copy) NSString *name;
@property(copy) NSString *path;
@property(copy) NSString *sourceTree;
@property(copy) NSString *explicitFileType;
@property(strong) NSNumber *includeInIndex;
@end
