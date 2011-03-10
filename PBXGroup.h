//
//  PBXGroup.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@interface PBXGroup : XcodeObject {
	NSArray *children;
	NSString *name;
	NSString *sourceTree;
}
@property(retain) NSArray *children;
@property(retain) NSString *name;
@property(retain) NSString *sourceTree;
@end
