#import "Blocks.h"

@implementation Blocks {
    NSArray* data;
    Class type;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        data = nil;
        type = nil;
        Blocks * __weak weakSelf = self;
        self.blockA = ^(NSArray *array) {
            data = array;
            [weakSelf sum];
        };
        self.blockB = ^(Class class) {
            type = class;
            [weakSelf sum];
        };
    }
    
    return self;
}

- (void) sum {
    if ((data == nil) || (type == nil)) {
        return;
    }
    
    if (type == [NSDate class]) {
        NSDate *result = [NSDate new];
        for (id datum in data) {
            if ([datum isKindOfClass:[NSDate class]]) {
                result = ([result laterDate:datum]);
            }
        }
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd.MM.yyyy";
        NSString *resultString = [dateFormatter stringFromDate:result];
        self.blockC(resultString);
    } else if (type == [NSString class]) {
        NSMutableString *result = [NSMutableString new];
        for (id datum in data) {
            if ([datum isKindOfClass:[NSString class]]) {
                [result appendString:datum];
            }
        }
        self.blockC(result);
    } else {
        NSNumber *result = [NSNumber new];
        for (id datum in data) {
            if ([datum isKindOfClass:[NSNumber class]]) {
                result = [NSNumber numberWithInt:[result intValue] + [datum intValue]];
            }
        }
        self.blockC(result);
    }
}

@end

