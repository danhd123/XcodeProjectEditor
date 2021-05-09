//
//  PBXTargetDependency.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class PBXContainerItemProxy, PBXNativeTarget;

@interface PBXTargetDependency : XcodeObject 
@property(copy) NSString *name;
- (PBXContainerItemProxy *)targetProxy;
- (void)setTargetProxy:(NSString *)tp;
- (PBXNativeTarget *)target;
- (void)setTarget:(NSString *)t;
@end
