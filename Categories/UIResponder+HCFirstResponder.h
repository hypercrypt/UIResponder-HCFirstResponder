//
//  UIResponder+HCFirstResponder.h
//
//  Created by Klaus-Peter Dudas on 04/12/2012.
//  Copyright (c) 2012 Hypercrypt Solutions Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (HCFirstResponder)

+ (instancetype)firstResponder;
+ (BOOL)resignFirstResponder;

@end

@interface UIViewController (HCFirstResponder)

- (IBAction)resignCurrentFirstResponder:(id)sender forEvent:(UIEvent *)event;

@end
