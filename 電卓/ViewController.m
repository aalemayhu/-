#import "ViewController.h"
#import "CCCalculator.h"

@interface ViewController () {
    BOOL shouldClear;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    shouldClear = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonPressed:(UIButton *)sender {

    NSString *textFieldText;
    
    if (shouldClear) {
        _textField.text = @"";
        shouldClear = !shouldClear;
    }
    
    switch (sender.tag) {
        case ADD:
            // TODO: Handle multiple ADD
            textFieldText = [NSString stringWithFormat:@"%@+", [[self textField] text]];
            break;
        case ANSWER:
            textFieldText = [CCCalculator resultsFor:[[self textField] text]];
            shouldClear = !shouldClear;
            break;
        default:
            textFieldText = [NSString stringWithFormat:@"%@%lu", [[self textField] text], sender.tag];
            break;
    }
        
    [_textField setText:textFieldText];
}


@end
