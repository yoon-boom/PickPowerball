//
//  PickNumberManager.h
//  PickANumber
//
//  Created by Yoon Lee on 1/13/16.
//  Copyright © 2016 Yoon Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PickNumberManager : NSObject

+ (instancetype)shared;

- (NSArray *)fiveNumbers;
- (NSNumber *)powerNumber;

@end
