//
//  MyClass+Swizzle.h
//  OverridingMethodCallsExample
//
//  Created by Ivan Kalaica on 09/01/14.
//  Copyright (c) 2014 Ivan Kalaica. All rights reserved.
//

#import "MyClass.h"

@interface MyClass (Swizzle)

- (NSString*)myString;

@end
