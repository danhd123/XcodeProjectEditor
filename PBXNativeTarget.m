//
//  PBXNativeTarget.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "PBXNativeTarget.h"
#import "XCConfigurationList.h"
#import "PBXFileReference.h"
#import "SYPBXProjArchiver.h"

@implementation PBXNativeTarget {
    NSString *_buildConfigurationList;
    NSString *_productReference;
}
- (NSArray *)buildPhases
{
	NSMutableArray *ret = [NSMutableArray arrayWithCapacity:[_buildPhases count]];
	for (NSString *phase in _buildPhases)
	{
		[ret addObject:[self.archiver.objectsByArchiveIDs objectForKey:phase]];
	}
	return ret;
}
- (PBXFileReference *)productReference
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_productReference];
}
- (void)setProductReference:(NSString *)newReference
{
	_productReference = newReference;
}
//TODO: check if I need to do the same with Build Rules and Dependencies
// probably (I don't see a PBXBuildRule though)
- (XCConfigurationList *)buildConfigurationList
{
	return [self.archiver.objectsByArchiveIDs objectForKey:_buildConfigurationList];
}
- (void)setBuildConfigurationList:(NSString *)newList
{
	_buildConfigurationList = newList;
}
-(NSDictionary *)attrs
{
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                _buildConfigurationList, @"buildConfigurationList",
                                           _buildPhases, @"buildPhases",
                                            _buildRules, @"buildRules",
                                          _dependencies, @"dependencies",
                                                  _name, @"name",
                                    _productInstallPath, @"productInstallPath",
                                           _productName, @"productName",
                                      _productReference, @"productReference",
                                           _productType, @"productType", nil];
	[dict addEntriesFromDictionary:[super attrs]];
	return dict;
}
@end
