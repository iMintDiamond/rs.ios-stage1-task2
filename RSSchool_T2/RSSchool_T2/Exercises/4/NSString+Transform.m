#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    bool isPangram = [self isPangram];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    NSArray *words = [[self componentsSeparatedByString: @" "] filteredArrayUsingPredicate:noEmptyStrings];
    NSMutableDictionary *transformedWords = [NSMutableDictionary dictionary];
    NSString *vowels = @"aeiouy";
    NSString *consonants = @"bcdfghjklmnpqrstvwxz";

    if ([words count] == 0) {
        return @"";
    }
    
    for (NSMutableString *word in words) {
        NSMutableString *wordCopy = [NSMutableString stringWithString:word];
        int counter = 0;
        for (int i = 0; i < [word length]; i++) {
            unichar character = [word characterAtIndex:i];
            NSString *letter = [[NSString stringWithFormat:@"%c", character] lowercaseString];
            
            if ((isPangram && [vowels containsString:letter]) //if pangram and letter is a vowel
                || (!isPangram && [consonants containsString:letter])) { //or not pangram and letter not a vowel
                [wordCopy replaceCharactersInRange:NSMakeRange(i, 1) withString:[letter uppercaseString]];
                counter++;
            }
        }
        
        [wordCopy insertString:[NSString stringWithFormat:@"%d", counter] atIndex:0];
        
        NSNumber *key = [NSNumber numberWithInt:counter];
        if ([transformedWords objectForKey:key] == nil) {
            [transformedWords setObject:[NSMutableArray arrayWithObject:wordCopy] forKey:key];
        } else {
            NSMutableArray *transformedWordArray = [transformedWords objectForKey:key];
            [transformedWordArray addObject:wordCopy];
            [transformedWords setObject:transformedWordArray forKey:key];
        }
    }
    
    NSMutableString *transformedString = [NSMutableString new];
    NSArray *sortedKeys =  [[transformedWords allKeys] sortedArrayUsingSelector:@selector(compare:)];
    for (NSNumber* key in sortedKeys) {
        NSArray *transformedWordArray = transformedWords[key];
        for (NSString *word in transformedWordArray) {
            [transformedString appendString:word];
            [transformedString appendString:@" "];
        }
    }
    [transformedString deleteCharactersInRange:NSMakeRange([transformedString length] - 1, 1)];
    
    return [NSString stringWithString:transformedString];
}

- (BOOL) isPangram {
    NSMutableSet *selfCharset = [NSMutableSet new];
    NSString *lowercasedSelf = [self lowercaseString];
    
    for (int i = 0; i < self.length; i++) {
        if ([[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[lowercasedSelf characterAtIndex:i]]) {
            [selfCharset addObject:[NSString stringWithFormat:@"%c", [lowercasedSelf characterAtIndex:i]]];
        }
    }
    
    if (selfCharset.count >= 26) {
        return TRUE;
    } else {
        return FALSE;
    }
}

@end
