#import "CCCalculator.h"

@implementation CCCalculator

#pragma mark - Public

+(id) resultsFor:(NSString *) expression {
    
    NSArray *words = [expression componentsSeparatedByCharactersInSet:[NSCharacterSet symbolCharacterSet]];
    
    NSUInteger numbers[[words count]];
    
    int i = 0;
    for (NSString *word in words) {
        numbers[i++] = [word integerValue];
    }
    
    NSUInteger a = 0;
    for (int i = 0; i < [words count]; i++) {
        a += numbers[i];
    }
    
    return [NSString stringWithFormat:@"%lu", a];
}

@end
