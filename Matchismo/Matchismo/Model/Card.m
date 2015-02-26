//
//  Card.m
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)cards
{
    int score = 0;
    
    for (Card *otherCard in cards) {
        if ([self.contents isEqualToString:otherCard.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
