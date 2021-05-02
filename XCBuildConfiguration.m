//
//  XCBuildConfiguration.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XCBuildConfiguration.h"
#import "SYPBXProjArchiver.h"

@implementation XCBuildConfiguration {
    NSString *_baseConfigurationReference;
}
- (void)setBaseConfigurationReference:(NSString *)baseConfigurationReference {
    _baseConfigurationReference = baseConfigurationReference;
}
- (PBXFileReference *)baseConfigurationReference {
    return self.archiver.objectsByArchiveIDs[_baseConfigurationReference];
}
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 _buildSettings, @"buildSettings",
								 _name, @"name",
                                 _baseConfigurationReference, @"baseConfigurationReference", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
