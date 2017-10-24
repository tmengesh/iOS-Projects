//
//  main.m
//  percentageCalculator
//
//  Created by Koulutus on 15/09/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleClass:NSObject
/* method declaration */
- (float)calculatePercentage:(int)num;
@end

@implementation SampleClass

/* method returning the max between two numbers */
- (float)calculatePercentage:(int)num {
    /* local variable declaration */
    return (height*weidth);
}

@end

int main ()
{
    /* local variable definition */
    int height = 10;
    int weidth = 4;
    int area;
    
    SampleClass *sampleClass = [[SampleClass alloc]init];
    
    /* calling a method to get max value */
    area = [sampleClass area:height andNum2:weidth];
    
    NSLog(@"Area is : %d\n", area );
    
    return 0;
}
