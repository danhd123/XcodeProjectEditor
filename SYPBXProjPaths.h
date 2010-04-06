//
//  SYPBXProjPaths.h
//  XcodeProjectEditor
//
//  Created by Daniel DeCovnick on 4/2/10.
//  Copyright 2010 Softyards Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SYPBXProjPaths : NSObject {

}
-(NSString *)projectFileAt:(NSString *)basePath;
-(NSString *)projectRootAt:(NSString *)basePath;
@end
