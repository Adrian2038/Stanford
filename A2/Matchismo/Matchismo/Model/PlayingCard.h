//
//  PlayingCard.h
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, assign) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
