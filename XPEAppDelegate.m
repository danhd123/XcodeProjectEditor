//
//  XPEAppDelegate.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 3/21/11.
//  Copyright 2011 Softyards Software. All rights reserved.
//

#import "XPEAppDelegate.h"


@implementation XPEAppDelegate
- (IBAction)parse:(id)sender
{
	NSString *string = [[NSString alloc] initWithString:@"Parse Button Works"];
	NSLog(@"%@", string);
	SYRelease(string); //testing the PCH
}
@end
