//
//  SYPBXProjEncoder.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYPBXProjEncoder.h"


@implementation SYPBXProjEncoder
-(NSString *)encode:(NSDictionary *)project
{
	return [NSString stringWithFormat:@"// !$*UTF8*$!\n%@\n", [self encodeHash:project withIndentation:0]];
}
-(NSString *)encodeHash:(NSDictionary *)hash withIndentation:(int)indent
{
	NSMutableString *ret = [NSMutableString stringWithString:@"{\n"];
	NSArray *map = [[hash allKeys] sortedArrayUsingSelector:@selector(compare:)];
	for (id key in map)
	{
		[ret appendFormat:@"%@%@ = %@;\n", [self encodeIndentation:indent+1], [self encodeValue:key withIndentation:indent+1], [slelf encodeObject:[hash objectForKey:key] withIndentation:indent+1]];
		[ret appendFormat:@"%@}", [self encodeIndentation:indent]];
	}
	return ret;
}
-(NSString *)encodeObject:(id)object withIndentation:(int)indent
{
	if ([object isKindOfClass:[NSDictionary class]])
	{
		return [self encodeHash:object withIndentation:indent];
	}
	else if ([object isKindOfClass:[NSArray class]])
	{
		return [self encodeArray:object withIndentation:indent];
	}
	else if ([object isKindOfClass:[NSString class]])
	{
		return [self encodeValue:object withIndentation:indent];
	}
	else 
	{
		NSLog(@"something went wrong trying to encode object: %@", object);
		return nil;
	}
}
-(NSString *)encodeArray:(NSArray *)myArray withIndentation:(int)indent
{
	NSMutableString *ret = [NSMutableString stringWithString:@"(\n"];
	for (id value in myArray)
	{
		[ret appendFormat:@"%@%@,\n", [self encodeIndentation:indent+1], [self encodeObject:value withIndentation:indent+1]];
	}
	[ret appendFormat:@"%@)", [self encodeIndentation:indent]];
	return ret;
}
-(NSString *)encodeValue:(id)value withIndentation:(int)indent
{
	return [value description]; //NSString doesn't have ruby's inspect. TODO: implement this or find a library that does
}
-(NSString *)encodeIndentation:(int)indent
{
	NSMutableString *ret = [NSMutableString string];
	for (int i = 0; i < indent; i++)
	{
		[ret appendString:@"\t"];
	}
	return ret;
}
@end
