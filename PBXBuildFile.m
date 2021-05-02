//
//  SYPBXBuildFile.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXBuildFile.h"
#import "SYPBXProjArchiver.h"

@implementation PBXBuildFile
@synthesize settings;
- (PBXFileReference *)fileRef
{
	return [self.archiver.objectsByArchiveIDs objectForKey:fileRef];
}
- (void)setFileRef:(NSString *)newRef
{
	fileRef = newRef;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 fileRef, @"fileRef",
								 settings, @"settings", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
