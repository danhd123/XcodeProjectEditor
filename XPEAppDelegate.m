//
//  XPEAppDelegate.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 3/21/11.
//  Copyright 2011 Softyards Software. All rights reserved.
//

#import "XPEAppDelegate.h"
#import "SYPBXProjArchiver.h"
#import "PBXProject.h"
#import "SYXCProjFileUtils.h"

@implementation XPEAppDelegate

-(id)init
{
	self = [super init];
	if (self != nil)
	{
		archiver = nil;
		project = nil;
	}
	return self;
}
- (IBAction)parse:(id)sender
{
	NSString *filePath = [pathBox stringValue];
	archiver = [[SYXCProjFileUtils loadProjectAt:filePath] retain];
	project = [[archiver unarchive] retain];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[project hashRepresentation]];
	for (id target in [project targets])
		[dict addEntriesFromDictionary:[target hashRepresentation]];
	[textView setString:[dict description]];
}
- (void)dealloc
{
	[archiver release];
	[project release];
	[super dealloc];
}
@end
