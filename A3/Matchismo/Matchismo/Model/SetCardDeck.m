//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Adrian on 15/3/1.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int number = 1; number <= [SetCard maxNumber]; number++) {
            for (int shading = -1; shading <= 1; shading++) {
                for (UIColor *color in [SetCard validColor]) {
                    for (NSString *symbol in [SetCard validSymbol]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.number = number;
                        card.shading = shading;
                        card.color = color;
                        card.symbol = symbol;
                    }
                }
            }
        }
    }
    
    return self;
}

@end
