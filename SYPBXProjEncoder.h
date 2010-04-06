//
//  SYPBXProjEncoder.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SYPBXProjEncoder : NSObject {

}
-(NSString *)encode:(NSDictionary *)project;
-(NSString *)encodeHash:(NSDictionary *)project withIndentation:(int)indent;
-(NSString *)encodeObject:(id)object withIndentation:(int)indent;
-(NSString *)encodeArray:(NSArray *)myArray withIndentation:(int)indent;
-(NSString *)encodeValue:(id)value withIndentation:(int)indent;
-(NSString *)encodeIndentation:(int)indent;
@end
