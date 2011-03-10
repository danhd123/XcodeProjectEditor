//
//  SYXcodeObject.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/6/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "XcodeObject.h"

//@interface XcodeObject ( )
//@property(retain) NSDictionary *attrs;
//@end

//Not necessary. Thank you KVC!


@implementation XcodeObject
@synthesize archiver;
@synthesize archiveID;
@synthesize version;
@synthesize attrs;
//-(id)objectForKey:(id)aKey
//{
//	return [attrs objectForKey:aKey];
//}	
//-(void)setObject:(id)anObject forKey:(id)aKey
//{
//	[attrs setObject:anObject forKey:aKey];
//}
-(id)initWithHash:(NSDictionary *)hash
{
	self = [super init];
	if (self)
	{
		self.attrs = [[hash mutableCopy] autorelease];
		if (![self isMemberOfClass:[XcodeObject class]])
		{
			NSString *class_name = [self className];
			if ([attrs objectForKey:@"isa"] == nil)
			{
				[attrs setObject:class_name forKey:@"isa"];
			}
		}
	}
	return self;
}
+(id)newWithArgs:(id)args
{
	//if (self != [XcodeObject class])
//	{
//		return [super newWithArgs:args];
//	}
	NSString *hash_isa = [[args objectAtIndex:0] objectForKey:@"isa"];
	if (hash_isa && NSClassFromString(hash_isa))
	{
		return [NSClassFromString(hash_isa) newWithArgs:args];
	}
	return nil;
	//return [super newWithArgs:args];
}
//-(NSArray *)attrKeys
//{
//	return [self.attrs allKeys];
//}
- (NSDictionary *)attrs
{
	return [NSDictionary dictionaryWithObject:[attrs objectForKey:@"isa"] forKey:@"isa"];
//	return [NSDictionary dictionaryWithObjectsAndKeys:archiveID, @"archiveID", version, @"version", nil];
}
- (NSDictionary *)hashRepresentation
{
	return [NSDictionary dictionaryWithObject:self.attrs forKey:self.archiveID];
}
+(id)fromHash:(NSDictionary *)anObject
{
	id ret = [NSClassFromString([anObject objectForKey:@"isa"]) new];
	if (!ret)
	{
		NSLog(@"%@ not implemented yet. If you see this in release, contact the developer immediately, and include your .pbxproj file.", [anObject objectForKey:@"isa"]);
		return nil;
	}
	NSMutableArray *otherKeys = [NSMutableArray arrayWithArray:[anObject allKeys]];
	[otherKeys removeObjectIdenticalTo:@"isa"];
	for (NSString *key in otherKeys)
	{
		[ret setValue:[anObject objectForKey:key] forKey:key];
	}
	return [ret autorelease];
	//Some things Ruby does better. This is not one of them. 
	
}

@end
