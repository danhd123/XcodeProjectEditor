//
//  SYPBXProjLexer.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SYPBXProjLexer : NSObject {

}
-(NSArray *)tokenize:(NSString *)source;
@end
