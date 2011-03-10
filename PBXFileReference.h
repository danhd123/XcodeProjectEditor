//
//  PBXFileReference.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"


@interface PBXFileReference : XcodeObject {
	NSNumber *fileEncoding;
	NSString *lastKnownFileType;
	NSString *name;
	NSString *path;
	NSString *sourceTree;
	NSString *explicitFileType;
	NSNumber *includeInIndex;
}
@property(retain) NSNumber *fileEncoding;
@property(retain) NSString *lastKnownFileType;
@property(retain) NSString *name;
@property(retain) NSString *path;
@property(retain) NSString *sourceTree;
@property(retain) NSString *explicitFileType;
@property(retain) NSNumber *includeInIndex;
@end
