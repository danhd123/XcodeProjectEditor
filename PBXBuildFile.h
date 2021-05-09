//
//  SYPBXBuildFile.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeObject.h"

@class PBXFileReference;

@interface PBXBuildFile : XcodeObject
-(PBXFileReference *)fileRef;
-(void)setFileRef:(NSString *)newRef;
@property(strong) NSMutableDictionary *settings;
@end
