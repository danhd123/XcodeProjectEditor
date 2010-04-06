//
//  SYPBXProjParser.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYPBXProjParser.h"
#import "SYPBXProjLexer.h"


@implementation SYPBXProjParser
+ (NSArray *)parse:(NSString *)projectString
{
	NSMutableArray *context = [NSMutableArray arrayWithObject:[NSMutableArray array]];
	NSArray *tokens = [SYPBXProjLexer tokenize:projectString];
	//id lastToken = nil;
	//this isn't used in the Ruby version either
	for (id token in tokens)
	{
		if ([token isKindOfClass:[NSNumber class]])
		{
			if ([token intValue] == begin_array)
			{
				[context addObject:[NSMutableArray array]];
			}
			else if ([token intValue] == begin_hash)
			{
				[context addObject:[NSMutableDictionary dictionary]];
			}
			else if ([token intValue] == end_array || [token intValue] == end_hash)
			{
				id last_object = [context lastObject];
				[context removeLastObject];
				if ([[context lastObject] isKindOfClass:[NSArray class]])
				{
					[[context lastObject] addObject:last_object];
				}
				else if ([[context lastObject] isKindOfClass:[NSString class]])
				{
					id hash_key = [context lastObject];
					[context removeLastObject];
					[[context lastObject] /* hopefully a dictionary */ setObject:last_object forKey:hash_key];
				}
			}
			else if ([token intValue] == assign || [token intValue] == stop || [token intValue] == comma) 
			{
				;//this is odd... I may be misreading the ruby syntax here
			}
		}
		else if ([token isKindOfClass:[NSArray class]])
		{
			if ([[token objectAtIndex:0] intValue] == encoding)
			{
				;
			}
			else if ([[token objectAtIndex:0] intValue] == string || [[token objectAtIndex:0] intValue] == symbol)
			{
				NSString *tokenString = [token lastObject];
				if ([[context lastObject] isKindOfClass:[NSDictionary class]])
				{
					[context addObject:tokenString];
				}
				else if ([[context lastObject] isKindOfClass:[NSArray class]])
				{
					[[context lastObject] addObject:tokenString];
				}
				else if ([[context lastObject] isKindOfClass:[NSString class]])
				{
					NSString *key = [context lastObject];
					[context removeLastObject];
					[context addObject:[NSDictionary dictionaryWithObject:tokenString forKey:key]];
				}
				else
				{
					NSLog(@"Something went wrong parsing. Here's the conext: %@", context);
					exit(1);
				}
			}
		}
		else
		{
			NSLog(@"Unknown token: %@", token);
		}
	}
	return [[context objectAtIndex:0] objectAtIndex:0]; 
	//this seems wrong. I think should always return the blank NSMutableArray declared at the beginning inner to context
}

@end
