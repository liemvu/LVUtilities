//
//  FileHelper.m
//  iMotivate
//
//  Created by Liem Vo Uy on 7/18/11.
//  Copyright 2011 home. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper

+ (BOOL) fileExistsAtPath: (NSString *) pathToFile
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    
    return [fileManager fileExistsAtPath:pathToFile isDirectory:&isDirectory] && !isDirectory;
}

+ (BOOL ) directoryExistsAtPath: (NSString *) pathToDirectory
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    
    return [fileManager fileExistsAtPath:pathToDirectory isDirectory:&isDirectory] && isDirectory;
}

+ (void) createDirectoryAtPath: (NSString *) pathToDirectory
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:pathToDirectory withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (BOOL) createDirectoryIfNotExistAtPath: (NSString *) pathToDirectory
{
    if([self directoryExistsAtPath:pathToDirectory])
        return NO;
    
    [self createDirectoryAtPath:pathToDirectory];
    return YES;
}

+ (void) copyFileAtPath: (NSString *) source toPath: (NSString *) destination
{
    if([self fileExistsAtPath:source] && ![self fileExistsAtPath:destination])
    {
        NSFileManager * fileManager = [NSFileManager defaultManager];
        [fileManager copyItemAtPath:source toPath:destination error:nil];
    }
}

+ (NSString *) documentDirPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *) dirPathForUsername: (NSString *) username
{
    NSString * path = [[self documentDirPath] stringByAppendingPathComponent:username];
    [self createDirectoryIfNotExistAtPath:path];
    return path;
}

+ (NSString *) customerDirPathForUsername: (NSString *) username
{
    NSString * path = [[self dirPathForUsername:username] stringByAppendingPathComponent:@"customers"];
    [self createDirectoryIfNotExistAtPath:path];
    return path;
}

+ (NSString *) propertyDirPathForUsername: (NSString *) username
{
    NSString * path = [[self dirPathForUsername:username] stringByAppendingPathComponent:@"properties"];
    [self createDirectoryIfNotExistAtPath:path];
    return path;
}

+ (NSString *) userDirPathForUsername: (NSString *) username
{
    NSString * path = [[self dirPathForUsername:username] stringByAppendingPathComponent:@"all_stuff"];
    [self createDirectoryIfNotExistAtPath:path];
    return path;
}

+ (BOOL) isExtenstionOfImage: (NSString *) extension
{
	extension = [extension lowercaseString];
	return 
    [@"jpg" isEqualToString:extension] || 
    [@"jpeg" isEqualToString:extension] ||
    [@"png" isEqualToString:extension] || 
    [@"tiff" isEqualToString:extension] ||
    [@"tif" isEqualToString:extension] ||
    [@"gif" isEqualToString:extension] ||
    [@"bmp" isEqualToString:extension] ||
    [@"BMPf" isEqualToString:extension] ||
    [@"ico" isEqualToString:extension] ||
    [@"cur" isEqualToString:extension] ||
    [@"xbm" isEqualToString:extension];
}

@end
