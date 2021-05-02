//
//  SYXcodeObject.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SYPBXProjArchiver;

@interface XcodeObject : NSObject {
	int version;
	id archiveID;
	NSMutableDictionary *attrs;
	SYPBXProjArchiver *archiver;
}
+(id)fromHash:(NSDictionary *)anObject;
-(NSDictionary *)hashRepresentation;
@property(assign) int version;
@property(retain) SYPBXProjArchiver *archiver;
@property(retain) id archiveID;
@property(nonatomic, retain) NSMutableDictionary *attrs;
@end
