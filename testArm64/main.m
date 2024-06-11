//
//  main.m
//  testArm64
//
//  Created by gaoyu on 2024/5/11.
//

#import <Foundation/Foundation.h>
#import "testSwitch.h"
#import "testFibonacci.h"
#import "testIf.h"
#import "testFunction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
                
        NSLog(@"%d", testLeafFunc(1, 2));
        NSLog(@"%d", testNoLeafFunc(1, 2));
        
        int fibNum = 40;
        int sum = fibonacci_asm(fibNum);
        int sum1 = fibonacci_asm_1(fibNum);
        NSLog(@"%d  %d", sum, sum1);
        
        testIf_asm(0);
        
        testSwitch_asm_1(10);
        testSwitch_asm_2(6);
        
    }
    return 0;
}
