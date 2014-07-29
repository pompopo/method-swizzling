//
//  NSObject+ReplaceMethod.h
//  ReplaceMethod
//
//  Created by pom on 2014/07/29.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ReplaceMethod)
- (void)replaceMethodWithBlock:(id)block selector:(SEL)sel;
@end
