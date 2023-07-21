//
//  CalculatorBrain.m
//  Lecture 2: Building A Simple Calculator
//
//  Created by Mert Arıcan on 20.07.2023.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

- (void)setOperand:(double)anOperand
{
    operand = anOperand;
}

- (void)setMemoryValue:(double)newValue
{
    memoryValue = newValue;
}

- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqual:waitingOperation]) {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

- (double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operation isEqual: @"1/x"]) {
        if (operand) {
            operand = 1.0 / operand;
        }
    } else if ([operation isEqual: @"+/-"]) {
        operand = -1.0 * operand;
    } else if ([operation isEqual: @"sin"]) {
        operand = sin(operand);
    } else if ([operation isEqual: @"cos"]) {
        operand = cos(operand);
    } else if ([operation isEqual:@"Store"]) {
        memoryValue = operand;
    } else if ([operation isEqual:@"Recall"]) {
        operand = memoryValue;
    } else if ([operation isEqual:@"Mem +"]) {
        memoryValue += operand;
    } else if ([operation isEqual:@"C"]) {
        operand = 0;
        memoryValue = 0;
        waitingOperand = 0;
        waitingOperation = nil;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

@end


// C const char star if not @ is used before NSString
