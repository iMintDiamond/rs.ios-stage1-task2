#import "TimeConverter.h"

@implementation TimeConverter

// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    int h = [hours intValue];
    int m = [minutes intValue];
    
    NSArray *numericAsWord = @[
        @"zero", @"one", @"two", @"three", @"four",
        @"five", @"six", @"seven", @"eight", @"nine",
        @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen",
        @"fifteen",  @"sixteen", @"seventeen", @"eighteen", @"nineteen",
        @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four",
        @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine"
    ];
    
    if (m == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", numericAsWord[h]];
        
    } else if (m == 1) {
        return [NSString stringWithFormat:@"one minute past %@", numericAsWord[h]];

    } else if (m == 59) {
        return [NSString stringWithFormat:@"one minute to %@", numericAsWord[(h % 12) + 1]];

    } else if (m == 15){
        return [NSString stringWithFormat:@"quarter past %@", numericAsWord[h]];

    } else if (m == 30){
        return [NSString stringWithFormat:@"half past %@", numericAsWord[h]];

    } else if (m == 45){
        return [NSString stringWithFormat:@"quarter to %@", numericAsWord[(h % 12) + 1]];
        
    } else if (m <= 30){
        return [NSString stringWithFormat:@"%@ minutes past %@", numericAsWord[m], numericAsWord[h]];

    } else if (m > 30 && m < 60){
        return [NSString stringWithFormat:@"%@ minutes to %@", numericAsWord[60 - m], numericAsWord[(h % 12) + 1]];
    }
    
    return @"";
}
@end
