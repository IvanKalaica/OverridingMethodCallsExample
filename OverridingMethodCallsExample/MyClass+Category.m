//
//  MyClass+Category.m
//  OverridingMethodCallsExample
//
//  Created by Ivan Kalaica on 09/01/14.
//  Copyright (c) 2014 Ivan Kalaica. All rights reserved.
//

#import "MyClass+Category.h"

@implementation MyClass (Category)

- (NSString*)myString
{
    return @"Category value";
}

@end
