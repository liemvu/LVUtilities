//
//  utils.h
//  Udoll
//
//  Created by Liem Vo Uy on 7/3/11.
//  Copyright 2011 home. All rights reserved.
//

#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...)
#endif
// ALog always displays output regardless of the DEBUG setting - Not used most of the time, standard NSLog is used instead as DEBUG symbols not included in release/distribution
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#ifndef UIColorFromRGB(rgbValue)
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#endif


#ifndef SAFE_RELEASE
#define SAFE_RELEASE(obj) [obj release], obj = nil
#endif

