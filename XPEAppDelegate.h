//
//  XPEAppDelegate.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 3/21/11.
//  Copyright 2011 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SYPBXProjArchiver, PBXProject;

@interface XPEAppDelegate : NSObject {
	IBOutlet NSImageView *fileWell;
	IBOutlet NSTextField *pathBox;
	IBOutlet NSView *fileDropTarget;
	IBOutlet NSButton *parseButton;
	IBOutlet NSTextView *textView;
	SYPBXProjArchiver *archiver;
	PBXProject *project;
}
- (IBAction)parse:(id)sender;
@end
