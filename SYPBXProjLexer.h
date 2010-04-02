//
//  SYPBXProjLexer.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum token_types {
	encoding, 
	begin_array,
	end_array,
	begin_hash,
	end_hash,
	assign,
	stop,
	comma,
	string,
	symbol
};
@interface SYPBXProjLexer : NSObject {

}
-(NSArray *)tokenize:(NSString *)source;
@end
