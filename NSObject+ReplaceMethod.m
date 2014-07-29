//
//  NSObject+ReplaceMethod.m
//  ReplaceMethod
//
//  Created by pom on 2014/07/29.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//
#import <objc/runtime.h>
#import "NSObject+ReplaceMethod.h"

@implementation NSObject (ReplaceMethod)
- (void)replaceMethodWithBlock:(id)block selector:(SEL)sel {
    NSMutableString *newClassName = NSStringFromClass([self class]).mutableCopy;
    do {
        [newClassName appendString:@"_"];
        
    } while (objc_getClass([newClassName UTF8String]) != nil);
    
    Class newClass = objc_allocateClassPair([self class], [newClassName UTF8String], 0);
    objc_registerClassPair(newClass);
    
    IMP newImplementation = imp_implementationWithBlock(block);
    
    Method newMethod = class_getInstanceMethod(newClass, sel);
    struct objc_method_description *methodDescription = method_getDescription(newMethod);
    class_replaceMethod(newClass, sel, newImplementation, methodDescription->types);
    object_setClass(self, newClass);
}
@end
