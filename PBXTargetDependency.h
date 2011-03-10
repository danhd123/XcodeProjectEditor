//
//  PBXTargetDependency.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XcodeObject.h"

@class PBXContainerItemProxy;

@interface PBXTargetDependency : XcodeObject {
	NSString *name;
	PBXContainerItemProxy *targetProxy;
}
@property(retain) NSString *name;
@property(retain) PBXContainerItemProxy *targetProxy;
@end
