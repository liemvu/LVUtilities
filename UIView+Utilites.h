//
//  UIView+Utilites.h
//  Udoll
//
//  Created by Liem Vo on 7/3/11.
//  Copyright 2011 home. All rights reserved.
//


@interface UIView(Utilites)

- (NSInteger) indexOfSubview: (UIView *) subview;
- (void) exchangeSubview: (UIView *) view1 withSubview: (UIView *) view2;
+ (id) viewWithNibName: (NSString *) name;
+ (id) viewWithNibName: (NSString *) name owner: (id) owner options: (NSDictionary *) options;
- (void) removeAllSubview;
- (UIView *) findFirstResponder;
- (BOOL) findAndResignFirstResponder;
- (void) addTapGestureRecognizer: (id) target action: (SEL) selector;
- (void) addToWindow;
@end
