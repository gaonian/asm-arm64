//
//  main.m
//  testArm64
//
//  Created by gaoyu on 2024/5/11.
//

// clang -S main_1.m

#include <stdio.h>

void switch_1(void) {}
void switch_2(void) {}
void switch_3(void) {}
void switch_4(void) {}
void switch_5(void) {}
void switch_6(void) {}
void switch_7(void) {}
void switch_other(void) {}

void testSwitch(void) {
    int score = 10;
    switch (score) {
        case 1:
            switch_1();
            break;
        case 2:
            switch_2();
            break;
        case 3:
            switch_3();
            break;
        case 4:
            switch_4();
            break;
//        case 5:
//            printf("5");
//            break;
            
        default:
            switch_other();
            break;
    }
}



//int hehe1(int a, int b) {
//    return a + b + 1;
//}
//
//int haha1(int a, int b) {
//    int c = hehe1(a, b);
//    return a + b + c;
//}
//
//int fibonacci1(int n) {
//    if (n <= 1){
//        return n;
//    } else {
//        return fibonacci1(n-1) + fibonacci1(n-2);
//    }
//}
//
//void testif1(void) {
//    int score = 90;
//    if (score >= 90) {
//        printf("优秀");
//    } else if (score >= 60 && score < 90) {
//        printf("及格");
//    } else {
//        printf("差");
//    }
//    printf("end\n");
//}
//
//void testSwitch(void) {
//    int score = 90;
//    switch (score) {
//        case 1:
//            printf("1");
//            break;
//        case 2:
//            printf("2");
//            break;
//        case 3:
//            printf("3");
//            break;
//        case 4:
//            printf("4");
//            break;
//        case 5:
//            printf("5");
//            break;
//        case 6:
//            printf("6");
//            break;
//        case 7:
//            printf("7");
//            break;
//        case 8:
//            printf("8");
//            break;
//        case 9:
//            printf("9");
//            break;
//        case 10:
//            printf("10");
//            break;
//        case 30:
//            printf("30");
//            break;
//        case 50:
//            printf("50");
//            break;
//        case 70:
//            printf("70");
//            break;
//        case 90:
//            printf("90");
//            break;
//            
//        default:
//            printf("other");
//            break;
//    }
//}
//
//int main(int argc, const char * argv[]) {
//    
//    return 0;
//}
