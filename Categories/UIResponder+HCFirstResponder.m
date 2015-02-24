//
//  UIResponder+HCFirstResponder.m
//
//  Created by Klaus-Peter Dudas on 04/12/2012.
//  Copyright (c) 2012 Hypercrypt Solutions Ltd. All rights reserved.
//

#import "UIResponder+HCFirstResponder.h"

#pragma mark -
@implementation UIResponder (HCFirstResponder__Private)

static __weak UIResponder *HCFirstResponder;

- (void)registerAsFirstResponder {
    
    if (self.isFirstResponder) {
        
        HCFirstResponder = self;
    }
}

@end

#pragma mark -
@implementation UIResponder (HCFirstResponder)

+ (instancetype)firstResponder {
    
    HCFirstResponder = nil;
    
    [[UIApplication sharedApplication] sendAction:@selector(registerAsFirstResponder) to:nil from:nil forEvent:nil];
    
    NSAssert(!HCFirstResponder || [HCFirstResponder isKindOfClass:[UIResponder class]], @"Not a UIResponder");
    
    return ([HCFirstResponder isKindOfClass:self]) ? HCFirstResponder : nil;
}

+ (BOOL)resignFirstResponder {
    
    return [[self firstResponder] resignFirstResponder];
}

@end

@implementation UIViewController (HCFirstResponder)

- (IBAction)resignCurrentFirstResponder:(id)sender forEvent:(UIEvent *)event {
    
    [UIResponder resignFirstResponder];
}

@end
