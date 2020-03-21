#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int prod = [number intValue];
    int fib1 = 0;
    int fib2 = 1;
    
    while (fib1 * fib2 < prod) {
        int newFib = fib1 + fib2;
        fib1 = fib2;
        fib2 = newFib;
    }
    
    if (fib1 * fib2 == prod) {
        return @[
            [[NSNumber alloc] initWithInt:fib1],
            [[NSNumber alloc] initWithInt:fib2],
            @1
        ];
    } else {
        return @[
            [[NSNumber alloc] initWithInt:fib1],
            [[NSNumber alloc] initWithInt:fib2],
            @0
        ];
    }
}
@end
