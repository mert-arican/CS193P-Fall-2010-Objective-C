//
//  ViewController.m
//  Lecture 2: Building A Simple Calculator
//
//  Created by Mert Arıcan on 20.07.2023.
//

#import "ViewController.h"

//@interface CalculatorViewController ()
//
//@end

@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    if (userIsInTheMiddleOfTypingANumber) {
        if (![digit isEqual:@"."] ||
            ([digit isEqual:@"."] && ![[display text] containsString:@"."])) {
            [display setText:[[display text] stringByAppendingString:digit]];
        }
    } else {
        if ([digit isEqual:@"."]) { digit = @"0."; }
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
}

@end
