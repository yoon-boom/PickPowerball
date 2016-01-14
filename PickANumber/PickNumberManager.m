//
//  PickNumberManager.m
//  PickANumber
//
//  Created by Yoon Lee on 1/13/16.
//  Copyright © 2016 Yoon Lee. All rights reserved.
//

#import "PickNumberManager.h"

@implementation PickNumberManager

+ (instancetype)shared
{
    static PickNumberManager *sharedInstance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        sharedInstance = [[PickNumberManager alloc] init];
    });
    
    return sharedInstance;
}

- (NSArray *)fiveNumbers
{
    NSMutableDictionary *pickedLotto = [[NSMutableDictionary alloc] initWithCapacity:5];
    while ([pickedLotto count] < 5) {
        NSInteger randInt = 1 + arc4random() % 69;
        NSString *key = [@(randInt) stringValue];
        if ([pickedLotto objectForKey:key] == NULL) {
            [pickedLotto setObject:@(randInt) forKey:key];
        }
    }
    
    return [pickedLotto allKeys];
}

- (NSNumber *)powerNumber
{
    NSInteger randInt = 1 + arc4random() % 36;
    return @(randInt);
}

@end
