#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ViewController.h"

@interface Interface : XCTestCase {
    
    NSString *textFieldExpectedText;
    ViewController *vc;
}

@end

@implementation Interface

- (void)setUp {
    [super setUp];
    
    textFieldExpectedText = @"";
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    vc = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    // Make sure viewDidLoad is called
    [vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    [super tearDown];
}

-(void) testPressing {
    // Test all our button actions
    for (int tag = DIGIT_ONE; tag <= DIGIT_NINE; tag++) {
        UIButton *button = (UIButton *) [[vc view] viewWithTag:tag];
        [button sendActionsForControlEvents:UIControlEventTouchUpInside];
        textFieldExpectedText = [NSString stringWithFormat:@"%lu", button.tag];
        XCTAssert([[[vc textField] text] isEqualToString:textFieldExpectedText], @"Missing action");
        [[vc textField] setText:@""];
    }
}

- (void)testFunctionality {
    
    // Let us see if 2+2 equals 4
    [[vc but_2] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc add_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc but_2] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc answer_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    textFieldExpectedText = @"4";
    XCTAssert([[[vc textField] text] isEqualToString:textFieldExpectedText], @"Wrong answer!");

    // Check if textField is cleared when entering more after an answer.
    [[vc but_4] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc add_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc but_9] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc answer_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    textFieldExpectedText = @"13";
    XCTAssert([[[vc textField] text] isEqualToString:textFieldExpectedText], @"Wrong answer!");
}

-(void) testPreventInvalidOperation {

    // Let us try pressing add multiple times.
    [[vc but_1] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc add_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc but_5] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc add_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[vc add_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    XCTAssert([[[vc textField] text] rangeOfString:@"+"].location != NSNotFound, @"Missing add");
    
    [[vc answer_but] sendActionsForControlEvents:UIControlEventTouchUpInside];
    textFieldExpectedText = @"6";
    XCTAssert([[[vc textField] text] isEqualToString:textFieldExpectedText], @"Wrong answer!");
}

-(void) testViewTags {
    // Check our tags
    XCTAssertEqual(vc.answer_but.tag, ANSWER);
    XCTAssertEqual(vc.add_but.tag, ADD);
    XCTAssertEqual(vc.but_1.tag, DIGIT_ONE);
    XCTAssertEqual(vc.but_2.tag, DIGIT_TWO);
    XCTAssertEqual(vc.but_3.tag, DIGIT_THREE);
    XCTAssertEqual(vc.but_4.tag, DIGIT_FOUR);
    XCTAssertEqual(vc.but_5.tag, DIGIT_FIVE);
    XCTAssertEqual(vc.but_6.tag, DIGIT_SIX);
    XCTAssertEqual(vc.but_7.tag, DIGIT_SEVEN);
    XCTAssertEqual(vc.but_8.tag, DIGIT_EIGHT);
    XCTAssertEqual(vc.but_9.tag, DIGIT_NINE);
}

@end
