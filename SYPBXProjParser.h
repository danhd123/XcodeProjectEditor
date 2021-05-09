//
//  SYPBXProjParser.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SYPBXProjParser : NSObject {

}
+ (NSDictionary *)parse:(NSString *)projectString;
+ (NSDictionary *)hashFromFile:(NSString *)filePath;
@end
