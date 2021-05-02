//
//  SYPBXProjLexer.m
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import "SYPBXProjLexer.h"
//#import "RegexKitLite.h"

@implementation SYPBXProjLexer
+(NSArray *)tokenize:(NSString *)source
{
#if 0
	NSString *regexString = @"^\\/\\/ !\\$\\*(.*?)\\*\\$!";
	//NSRange matchedRange = NSMakeRange(NSNotFound, 0UL);
	//NSError *error = NULL;
	//matchedRange = [source rangeOfRegex:regexString options:RKLNoOptions inRange:NSMakeRange(0, [source length]) capture:1L error:&error];
	NSString *fullMatch = [source stringByMatching:regexString capture:0];
	int i = [fullMatch length];
	NSString *encodingMatch = [source stringByMatching:regexString capture:1];
	NSDictionary *singleCharMap = [NSDictionary dictionaryWithObjectsAndKeys:
								   [NSNumber numberWithInt:begin_array], @"(",
								   [NSNumber numberWithInt:end_array], @")",
								   [NSNumber numberWithInt:begin_hash], @"{",
								   [NSNumber numberWithInt:end_hash], @"}",
								   [NSNumber numberWithInt:assign], @"=",
								   [NSNumber numberWithInt:stop], @";",
								   [NSNumber numberWithInt:comma], @",", nil];
	if (!fullMatch)
	{
		NSLog(@"No encoding");
		return nil;
	}
	NSMutableArray *tokens = [NSMutableArray arrayWithObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:encoding], encodingMatch, nil]];
	while (i < [source length])
	{
		if ([[source substringWithRange:NSMakeRange(i, 2)] isEqualToString:@"/*"])
		{
			i+= 2;
			while (![[source substringWithRange:NSMakeRange(i, 2)] isEqualToString:@"/*"])
			{
				i+= 1;				
			}
			i+=2;
			continue;
		}
		NSString *test = [source substringWithRange:NSMakeRange(i, 1)];
		if ([test isMatchedByRegex:@"\\s"])
		{
			i+=1;
			continue;
		}
		if ([test isEqualToString:@"("] || 
			[test isEqualToString:@")"] ||
			[test isEqualToString:@"{"] ||
			[test isEqualToString:@"}"] ||
			[test isEqualToString:@"="] ||
			[test isEqualToString:@";"] ||
			[test isEqualToString:@","])
		{
			[tokens addObject:[singleCharMap objectForKey:test]]; //what do you mean there's no such thing as an enum in an NSArray?
			i+= 1;
			continue;
		}
		if ([test isEqualToString:@"\""])
		{
			i+=1;
			NSMutableString *tokenString = [NSMutableString string];
			while (![[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"\""])
			{
				if ([[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"\\"])
				{
					i+=1;
					if ([[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"n"])
					{
						[tokenString appendString:@"\n"];
						i+=1;
					}
					else if ([[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"r"])
					{
						[tokenString appendString:@"\r"];
						i+=1;
					}
					else if	([[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"t"])
					{
						[tokenString appendString:@"\t"];
						i+=1;
					}
					else if ([[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"\""] ||
							 [[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"'"] ||
							 [[source substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"\\"])
					{
						[tokenString appendString:[source substringWithRange:NSMakeRange(i, 1)]];
						i+=1;
					}
					else 
					{
						NSLog(@"Something went wrong in tokenizing - unknown escape sequence");
						return nil;
					}
				}
				else
				{
					[tokenString appendString:[source substringWithRange:NSMakeRange(i, 1)]];
					i+=1;
				}
			}
			[tokens addObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:string], tokenString, nil]];
			i+=1;
		}
		else
		{
			int len = 0;
			while ([[source substringWithRange:NSMakeRange(i+len, 1)] isMatchedByRegex:@"[^\\s\\t\\r\\n\\f(){}=;,]"])
				i+=1;
			[tokens addObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:symbol], [source substringWithRange:NSMakeRange(i, len)], nil]];
			i+= len;
		}
	}
	return tokens;
#endif
    return nil;
}
@end
