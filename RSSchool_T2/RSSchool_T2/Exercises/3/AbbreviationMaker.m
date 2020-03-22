#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *mutatedA = [NSMutableString stringWithString:[a uppercaseString]];
    int indexB = 0;
    int indexA = 0;
    while (indexA < [mutatedA length]) {
        unichar characterA = [mutatedA characterAtIndex:indexA];
        unichar characterB = [b characterAtIndex:indexB];
        if (characterA == characterB) {
            indexA++;
            if (indexB != [b length] - 1) {
                indexB++;
            }
        } else {
            [mutatedA replaceCharactersInRange:NSMakeRange(indexA, 1) withString:@""];
        }
    }
    
    return [mutatedA isEqualToString:b] ? @"YES" : @"NO";
}
@end
