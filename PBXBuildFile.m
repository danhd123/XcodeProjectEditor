//
//  SYPBXBuildFile.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXBuildFile.h"
#import "SYPBXProjArchiver.h"

@implementation PBXBuildFile {
    NSString *_fileRef;
}
- (PBXFileReference *)fileRef
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_fileRef];
}
- (void)setFileRef:(NSString *)newRef
{
	_fileRef = newRef;
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _fileRef, @"fileRef",
								 _settings, @"settings", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
