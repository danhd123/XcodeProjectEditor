//
//  SYPBXProjArchiver.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYPBXProjArchiver.h"
#import "SYPBXProjParser.h"
#import "SYPBXProjEncoder.h"
#import "XcodeObject.h"
#import "PBXProject.h"

//@interface SYPBXProjParser ()
//@property
//@end

@implementation SYPBXProjArchiver {
    NSMutableDictionary *_objectsByArchiveIDs;
    NSDictionary *_projectHash;
}
-(id)initWithHash:(NSDictionary *)hash
{
	self = [super init];
	if (self)
	{
		_objectsByArchiveIDs = [[NSMutableDictionary alloc] init];
		srandom(time(0));
		_projectHash = hash;
	}
	return self;
}

-(NSString *)archiveIDForObject:(id)object
{
	if ([object archiveID] && ![self.objectsByArchiveIDs objectForKey:[object archiveID]])
	{
		[_objectsByArchiveIDs setObject:object forKey:[object archiveID]];
		return [object archiveID];
	}
	NSMutableString *arcId = [NSMutableString stringWithCapacity:24];
	while (1)
	{
		for (int i = 0; i < 24; i+=2)
		{
            [arcId appendFormat:@"%02lX", random()%256];
		}
		if ([self.objectsByArchiveIDs objectForKey:arcId])
			continue;
		[object setArchiveID:arcId];
		[_objectsByArchiveIDs setObject:object forKey:arcId];
		return arcId;
	}
}

+ (SYPBXProjArchiver *)newUnarchiverWithFile:(NSString *)filePath;
{
	//NSDictionary *projectHash = [SYPBXProjParser parse:contents];
	// or 
	NSDictionary *projectHash = [SYPBXProjParser hashFromFile:filePath];
	SYPBXProjArchiver *project = [[self alloc] initWithHash:projectHash];
	return project;
}
- (PBXProject *)unarchive
{
	if (![[_projectHash objectForKey:@"archiveVersion"] isEqualToString:@"1"])
	{
		NSLog(@"Unknown archive version.");
		return nil;
	}
	if ([[_projectHash objectForKey:@"classes"] count] != 0)
	{
		NSLog(@"classes not implemented");
		return nil;
	}
	int version = [[_projectHash objectForKey:@"archiveVersion"] intValue];
	NSMutableDictionary *objects = [NSMutableDictionary dictionary];
	NSArray *keys = [[_projectHash objectForKey:@"objects"] allKeys];
	for (id key in keys)
	{
		
		XcodeObject *object = [XcodeObject fromHash:[[_projectHash objectForKey:@"objects"] objectForKey:key]];
		object.version = version;
		object.archiveID = key;
		object.archiver = self;
		[objects setObject:object forKey:key];
        [_objectsByArchiveIDs setObject:object forKey:key];
	}
	keys = [objects allKeys];
	//More stuff that's unnecessary in ObjC
	//just ommitting it this time rather than writing and commenting it out. 
	return [objects objectForKey:[_projectHash objectForKey:@"rootObject"]];
	
}
+ (PBXProject *)unarchiveHash:(NSDictionary *)hash
{
	if (![[hash objectForKey:@"archiveVersion"] isEqualToString:@"1"])
	{
		NSLog(@"Unknown archive version.");
		return nil;
	}
	if ([[hash objectForKey:@"classes"] count] != 0)
	{
		NSLog(@"classes not implemented");
		return nil;
	}
	int version = [[hash objectForKey:@"archiveVersion"] intValue];
	NSMutableDictionary *objects = [NSMutableDictionary dictionary];
	NSArray *keys = [[hash objectForKey:@"objects"] allKeys];
	for (id key in keys)
	{
		
		XcodeObject *object = [XcodeObject fromHash:[objects objectForKey:key]];
		object.version = version;
		object.archiveID = key;
		[objects setObject:object forKey:key];
	}
	keys = [objects allKeys];
	//More stuff that's unnecessary in ObjC
	//just ommitting it this time rather than writing and commenting it out. 
	return [objects objectForKey:[hash objectForKey:@"rootObject"]];
}
- (NSDictionary *)archiveToHash
{
	NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithObject:@"1" forKey:@"archiveVersion"];
	[ret setObject:[NSDictionary dictionary] forKey:@"classes"];
	NSMutableDictionary *objects = [NSMutableDictionary dictionaryWithCapacity:[_objectsByArchiveIDs count]];
	for (NSString *key in _objectsByArchiveIDs)
	{
		[objects setObject:[[_objectsByArchiveIDs objectForKey:key] attrs] forKey:key];
	}
	[ret setObject:objects forKey:@"objects"];
	return ret;
}
@end
