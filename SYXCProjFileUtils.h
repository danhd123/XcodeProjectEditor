//
//  SYXCProjFileUtils.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 5/5/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

// Objective-C counterpart to shortcuts.rb

#import <Cocoa/Cocoa.h>

@class SYPBXProjArchiver;

@interface SYXCProjFileUtils : NSObject {}
+ (SYPBXProjArchiver *)loadProjectAt:(NSString *)path;
+ (void)dumpProjectArchiver:(SYPBXProjArchiver *)project atPath:(NSString *)path;

@end
