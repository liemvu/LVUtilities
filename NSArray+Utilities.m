//
//  NSArray+Utilities.m
//  Udoll
//
//  Created by Liem Vo Uy on 7/5/11.
//  Copyright 2011 home. All rights reserved.
//

#import "NSArray+Utilities.h"
#include <stdlib.h>

@implementation NSArray(Utilities)

- (id) firstOrDefault
{
    return [self count] > 0 ? [self objectAtIndex:0] : nil;
}

- (id) anyObject
{
    int r = arc4random() % [self count];
    return [self objectAtIndex:r];
}

- (NSArray *) shuffling
{
    NSMutableArray * array = [NSMutableArray arrayWithArray:self];
    for(int i=0; i< [self count]; i++)
    {
        int r = arc4random() % [self count];
        id obj1 = [[[array objectAtIndex:i] retain] autorelease];
        id obj2 = [[[array objectAtIndex:r] retain] autorelease];
        [array replaceObjectAtIndex:i withObject:obj2];
        [array replaceObjectAtIndex:r withObject:obj1];
    }
    
    return array;
}

- (BOOL) containsString: (NSString *) str
{
    for(NSString * aStr  in self)
    {
        if([str isEqualToString:aStr])
        {
            return YES;
        }
    }
    
    return NO;
}

@end
