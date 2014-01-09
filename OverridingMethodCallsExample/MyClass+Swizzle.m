//
//  MyClass+Swizzle.m
//  OverridingMethodCallsExample
//
//  Created by Ivan Kalaica on 09/01/14.
//  Copyright (c) 2014 Ivan Kalaica. All rights reserved.
//

#import "MyClass+Swizzle.h"
#import <objc/runtime.h>

void SwizzleInstanceMethod(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

void SwizzleClassMethod(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getClassMethod(c, orig);
    Method newMethod = class_getClassMethod(c, new);

    c = object_getClass((id)c);

    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

@implementation MyClass (Swizzle)

+ (void)load
{
    // + (void)load is called very early in the app life-cycle. This is a special feature of Objective-C. For details, see the documentation of +(void)load.
    SwizzleInstanceMethod([self class], @selector(myString), @selector(myStringSwizzled));
}

- (NSString*)myStringSwizzled
{
    return @"Swizzled Method value";
}

@end
