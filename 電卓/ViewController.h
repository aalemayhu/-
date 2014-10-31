#import <UIKit/UIKit.h>

#define       ANSWER          -1
#define       ADD             0
#define       DIGIT_ONE       1
#define       DIGIT_TWO       2
#define       DIGIT_THREE     3
#define       DIGIT_FOUR      4
#define       DIGIT_FIVE      5
#define       DIGIT_SIX       6
#define       DIGIT_SEVEN     7
#define       DIGIT_EIGHT     8
#define       DIGIT_NINE      9

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *but_1;
@property (weak, nonatomic) IBOutlet UIButton *but_2;
@property (weak, nonatomic) IBOutlet UIButton *but_3;
@property (weak, nonatomic) IBOutlet UIButton *but_4;
@property (weak, nonatomic) IBOutlet UIButton *but_5;
@property (weak, nonatomic) IBOutlet UIButton *but_6;
@property (weak, nonatomic) IBOutlet UIButton *but_7;
@property (weak, nonatomic) IBOutlet UIButton *but_8;
@property (weak, nonatomic) IBOutlet UIButton *but_9;
@property (weak, nonatomic) IBOutlet UIButton *add_but;
@property (weak, nonatomic) IBOutlet UIButton *answer_but;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

