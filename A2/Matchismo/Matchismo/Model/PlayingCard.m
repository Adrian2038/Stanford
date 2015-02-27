//
//  PlayingCard.m
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// Override from the Card class
- (int)match:(NSArray *)cards
{
    int score = 0;
    
    if (cards.count == 1) {
        if ([[cards firstObject] isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)[cards firstObject];
            if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            } else if (self.rank == otherCard.rank){
                score = 4;
            }
        }
    }
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♠️", @"♦️", @"♣️", @"♥️"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}


+ (NSArray *)rankStrings
{
    return  @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
              @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [[PlayingCard rankStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
