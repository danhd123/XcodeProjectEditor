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
- (IBAction)browse:(id)sender
{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setDelegate:self];
    [openPanel runModal];
    NSURL *selection = [openPanel URL];
    NSString *path = selection.path;
    [pathBox setStringValue:path];
}
- (IBAction)parse:(id)sender
{
    archiver = nil;
    project = nil;
	NSString *filePath = [pathBox stringValue];
	archiver = [SYXCProjFileUtils loadProjectAt:filePath];
	project = [archiver unarchive];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[project hashRepresentation]];
	for (id target in [project targets])
		[dict addEntriesFromDictionary:[target hashRepresentation]];
	[textView setString:[dict description]];
}
- (BOOL)panel:(id)sender shouldEnableURL:(NSURL *)url {
    if ([url.pathExtension isEqualToString:@"xcodeproj"]) {
        return true;
    }
    return false;
}

@end
