
method swizzling for an instance, not for a class

================
# Example
    NSObject *objA = [[NSObject alloc] init];
    NSObject *objB = [[NSObject alloc] init];
    NSLog(@"description of A = %@", objA); // "description of A = <NSObject: 0x109247c00>"
    NSLog(@"description of B = %@", objB); // "description of B = <NSObject: 0x109239010>"
    
    [objB replaceMethodWithBlock:(NSString *)^(id sender) { 
        return @"pyonpyon";
    }
                        selector:@selector(description)];
  
    // no effect on objA
    NSLog(@"description of A = %@", objA); // "description of A = <NSObject: 0x109247c00>"
    
    // objB's description returns @"pyonpyon"
    NSLog(@"description of B = %@", objB); // "description of B = pyonpyon"
