//
//  PBXFileReference.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/9/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXFileReference.h"


@implementation PBXFileReference
- (NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	if (_fileEncoding)
	{
		[dict setObject:_fileEncoding forKey:@"fileEncoding"];
	}
	if (_lastKnownFileType)
	{
		[dict setObject:_lastKnownFileType forKey:@"lastKnownFileType"];
	}
	if (_name)
	{
		[dict setObject:_name forKey:@"name"];
	}
	if (_path)
	{
		[dict setObject:_path forKey:@"path"];
	}
	if (_sourceTree)
	{
		[dict setObject:_sourceTree forKey:@"sourceTree"];
	}
	if (_explicitFileType)
	{
		[dict setObject:_explicitFileType forKey:@"explicitFileType"];
	}
	if (_includeInIndex)
	{
		[dict setObject:_includeInIndex forKey:@"includeInIndex"];
	}
    if (_xcLanguageSpecificationIdentifier) {
        dict[@"xcLanguageSpecificationIdentifier"] = _xcLanguageSpecificationIdentifier;
    }
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
	//this is a somewhat longer implementation, because not all of these have to exist
    //this seems likely to be the case at some point... should probably do that for all classes.
}
@end
