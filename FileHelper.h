//
//  FileHelper.h
//  iMotivate
//
//  Created by Liem Vo Uy on 7/18/11.
//  Copyright 2011 home. All rights reserved.
//

@interface FileHelper : NSObject {
    
}

+ (BOOL) fileExistsAtPath: (NSString *) pathToFile;
+ (BOOL) directoryExistsAtPath: (NSString *) pathToDirectory;
+ (void) createDirectoryAtPath: (NSString *) pathToDirectory;
+ (BOOL) createDirectoryIfNotExistAtPath: (NSString *) pathToDirectory;
+ (void) copyFileAtPath: (NSString *) source toPath: (NSString *) destination;
+ (BOOL) isExtenstionOfImage: (NSString *) extension;

+ (NSString *) documentDirPath;
+ (NSString *) dirPathForUsername: (NSString *) username;
+ (NSString *) customerDirPathForUsername: (NSString *) username;
+ (NSString *) propertyDirPathForUsername: (NSString *) username;
+ (NSString *) userDirPathForUsername: (NSString *) username;
@end
