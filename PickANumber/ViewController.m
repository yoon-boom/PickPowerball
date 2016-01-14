//
//  ViewController.m
//  PickANumber
//
//  Created by Yoon Lee on 1/13/16.
//  Copyright © 2016 Yoon Lee. All rights reserved.
//

#import "ViewController.h"
#import "PickNumberManager.h"

#define CLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    dispatch_async(dispatch_queue_create("picknumber.randomize", DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        [self getLotteryNumber:1000000];
    });
}

- (void)getLotteryNumber:(NSInteger)numOfLottos
{
    for (int k = 0; k < numOfLottos; k ++) {
        NSArray *fiveNum = [[[PickNumberManager shared] fiveNumbers] sortedArrayUsingSelector:@selector(compare:)];
        NSString *fiveNumStr = @"";
        NSNumber *singleNum = [[PickNumberManager shared] powerNumber];
        NSString *firstNumStr = [fiveNum firstObject];
        fiveNumStr = [fiveNumStr stringByAppendingString:firstNumStr];
        for (int i = 1; i < [fiveNum count]; i ++) {
            NSString *numStr = fiveNum[i];
            fiveNumStr = [fiveNumStr stringByAppendingString:[NSString
                                                              stringWithFormat:@"-%@", numStr]];
        }
        
        CLog(@"%@ / %@\n", fiveNumStr, singleNum);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
