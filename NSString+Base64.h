//
//  NSString+Base64.h
//  Base64DecodeSample
//
//  Created by Liem Vo Uy on 8/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString(Base64)
+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;
- (NSData *) base64Data;
@end
