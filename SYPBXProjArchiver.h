//
//  SYPBXProjArchiver.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PBXProject;


@interface SYPBXProjArchiver : NSObject 
@property (readonly, copy) NSDictionary *objectsByArchiveIDs;
+ (SYPBXProjArchiver *)newUnarchiverWithFile:(NSString *)filePath;
- (PBXProject *)unarchive;
+ (PBXProject *)unarchiveHash:(NSDictionary *)hash;
- (NSDictionary *)archiveToHash;
@end
