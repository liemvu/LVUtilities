//
//  UIView+Utilites.m
//  Udoll
//
//  Created by Liem Vo on 7/3/11.
//  Copyright 2011 home. All rights reserved.
//

#import "UIView+Utilites.h"


@implementation UIView(Utilites)

- (NSInteger) indexOfSubview: (UIView *) subview
{
	NSInteger count = 0;
	for (UIView * view in self.subviews)
	{
		if(view == subview)
		{
			return count;
		}
		count++;
	}
	
	return NSNotFound;
}

- (void) exchangeSubview: (UIView *) view1 withSubview: (UIView *) view2
{
	NSInteger view1Index = [self indexOfSubview:view1];
	NSInteger view2Index = [self indexOfSubview:view2];
	
	if(view1Index != NSNotFound && view2Index != NSNotFound)
	{
		[self exchangeSubviewAtIndex:view1Index withSubviewAtIndex:view2Index];
	}
}

+ (id) viewWithNibName: (NSString *) name
{
	return [self viewWithNibName:name owner:nil options:nil];
}

+ (id) viewWithNibName: (NSString *) name owner: (id) owner options: (NSDictionary *) options
{
	NSArray * toplevelObjects = [[NSBundle mainBundle] loadNibNamed:name owner:owner options:options];
	
	if([toplevelObjects count] > 0)
		return [toplevelObjects objectAtIndex:0];
	
	return nil;
}

- (void) removeAllSubview
{
    for(UIView * subview in [self subviews])
    {
        [subview removeFromSuperview];
    }
}

- (UIView *) findFirstResponder
{
	if(self.isFirstResponder)
		return self;
	
	for(UIView *subview in self.subviews)
	{
		UIView *aView	=	[subview findFirstResponder];
		
		if(aView)
			return aView;
	}
	
	return nil;
}

- (BOOL) findAndResignFirstResponder
{
	UIView *responser	=	[self findFirstResponder];
	if(responser)
	{
		[responser resignFirstResponder];
		return YES;
	}
	
	return NO;
}

- (void) addTapGestureRecognizer: (id) target action: (SEL) selector
{
	UITapGestureRecognizer * tapReg = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
	[self addGestureRecognizer:tapReg];
	[tapReg release];
}

- (void) addToWindow
{
    [self removeFromSuperview];
	UIWindow	*keyWindow	=	[UIApplication sharedApplication].keyWindow;
	
	if([[keyWindow subviews] count] > 0)
	{
		UIView		*rootView	=	[[keyWindow subviews] objectAtIndex:0];
		[rootView addSubview:self];		
	}
	else 
	{
		[keyWindow addSubview:self];
	}
}

@end
