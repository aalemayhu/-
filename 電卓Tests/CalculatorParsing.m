#import <XCTest/XCTest.h>

#import "CCCalculator.h"

@interface CalculatorParsing : XCTestCase {
    
    CCCalculator *calc;
}

@end

@implementation CalculatorParsing

- (void)setUp {
    [super setUp];
    
    calc = [CCCalculator new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAddition {
    
    for (int a = 2; a < 20; a++) {
        for (int b = a * 2; b < 5; b++) {            
            NSString *expression = [NSString stringWithFormat:@"%d+%d", a, b];
            NSString *answer = [CCCalculator resultsFor:expression];
            NSString *correctAnswer = [NSString stringWithFormat:@"%d", a+b];
            XCTAssert([answer isEqualToString:correctAnswer], @"Invalid results.");
        }
    }
}

@end
