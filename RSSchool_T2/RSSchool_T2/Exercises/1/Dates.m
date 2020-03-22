#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"ru"]];
    
    NSString *dateAsString = [NSString stringWithFormat:@"%@ %@ %@", day, month, year];
    [dateFormatter setDateFormat:@"d M y"];
    NSDate *date  = [dateFormatter dateFromString:dateAsString];
    [dateFormatter setDateFormat:@"d MMMM, EEEE"];
    NSString *newDate = [dateFormatter stringFromDate:date];

    return (newDate == nil) ? @"Такого дня не существует" : newDate;
}

@end
