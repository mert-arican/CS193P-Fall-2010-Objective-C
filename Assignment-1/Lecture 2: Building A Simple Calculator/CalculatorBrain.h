//
//  CalculatorBrain.h
//  Lecture 2: Building A Simple Calculator
//
//  Created by Mert Arıcan on 20.07.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorBrain : NSObject {
    double operand;
    double memoryValue;
    NSString *waitingOperation;
    double waitingOperand;
}

- (void)setOperand:(double)anOperand;
- (void)setMemoryValue:(double)newValue;
- (double)performOperation:(NSString *)operation;

@end

NS_ASSUME_NONNULL_END
