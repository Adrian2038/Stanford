//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Adrian on 15/2/27.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) NSString *gameDetail;
@property (nonatomic, strong) NSMutableArray *cards; // of cards
@property (nonatomic, strong) NSMutableArray *matchStyleCards;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (NSMutableArray *)matchStyleCards
{
    if (!_matchStyleCards) {
        _matchStyleCards = [[NSMutableArray alloc] init];
    }
    return _matchStyleCards;
}

// draw some random card from deck, if number is more than the deck of cards , the game will dead.
- (instancetype)initWithCardNumber:(NSUInteger)number withDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < number; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define COST_TO_CHOOSE 1

// The main logic of the match game
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            
            if ([self.matchStyleCards containsObject:card]) {
                [self.matchStyleCards removeObject:card];
            }
            self.gameDetail = [self showGameDetailWithCards:self.matchStyleCards
                                                   withCard:nil
                                                      score:0
                                                   useScore:NO];
        } else {
            self.gameDetail = [self showGameDetailWithCards:self.matchStyleCards
                                                   withCard:card
                                                      score:0
                                                   useScore:NO];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    if (![self.matchStyleCards containsObject:otherCard]) {
                        [self.matchStyleCards addObject:otherCard];
                    }
                    NSInteger matchScore = 0;
                    if (self.useThreeMatchStyle) {
                        if (self.matchStyleCards.count == 2) {
                            Card *firstCard = self.matchStyleCards[0];
                            Card *secondCard = self.matchStyleCards[1];
                            matchScore = [firstCard match:@[secondCard]];
                            matchScore += [card match:self.matchStyleCards];
                            self.gameDetail = [self showGameDetailWithCards:self.matchStyleCards
                                                                   withCard:card
                                                                      score:matchScore
                                                                   useScore:YES];

                            [self card:card match:self.matchStyleCards withScore:matchScore];
                        } else {
                            self.gameDetail = [self showGameDetailWithCards:self.matchStyleCards
                                                                   withCard:card
                                                                      score:0
                                                                   useScore:NO];
                        }
                    } else {
                        matchScore = [card match:self.matchStyleCards];
                        self.gameDetail = [self showGameDetailWithCards:self.matchStyleCards
                                                               withCard:card
                                                                  score:matchScore
                                                               useScore:YES];
                        [self card:card match:self.matchStyleCards withScore:matchScore];
                        break;
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return self.cards[index];
}

- (void)card:(Card *)card match:(NSMutableArray *)cards withScore:(NSInteger)matchScore
{
    if (matchScore) {
        self.score += matchScore * MATCH_BONUS;
        card.matched = YES;
        for (Card *otherCard in cards) {
            otherCard.matched = YES;
        }
        [cards removeAllObjects];
    } else {
        self.score -= MISMATCH_PENALTY;
        Card *firstCard = [cards firstObject];
        firstCard.chosen = NO;
        [cards removeObject:firstCard];
    }
}

- (NSString *)showGameDetailWithCards:(NSMutableArray *)cards
                             withCard:(Card *)card
                                score:(NSInteger)matchScore
                             useScore:(BOOL)useScore
{
    NSInteger score = 0;
    if (matchScore) {
        score = matchScore * MATCH_BONUS;
    } else {
        score = -(MISMATCH_PENALTY + COST_TO_CHOOSE);
    }

    NSString *cardsContent = nil;
    if (cards.count == 0) {
        cardsContent = nil;
    }
    else if (cards.count == 1) {
        Card *firstCard = [cards firstObject];
        cardsContent = [NSString stringWithFormat:@"%@", firstCard.contents];
    } else if (cards.count == 2) {
        Card *firstCard = cards[0];
        Card *secondCard = cards[1];
        cardsContent =  [NSString stringWithFormat:@"%@%@", firstCard.contents, secondCard.contents ];
    }
    
    if (useScore) {
        if (card) {
            if (cardsContent) {
                return [NSString stringWithFormat:@"%@%@ %ld", cardsContent, card.contents, (long)score];
            }
            return [NSString stringWithFormat:@"%@", card.contents];
        } else {
            if (cardsContent) {
                return [NSString stringWithFormat:@"%@", cardsContent];
            }
            return @"Choose Nothing";
        }
    } else {
        if (card) {
            if (cardsContent) {
                return [NSString stringWithFormat:@"%@%@", cardsContent, card.contents];
            }
            return [NSString stringWithFormat:@"%@", card.contents];
        } else {
            if (cardsContent) {
                return [NSString stringWithFormat:@"%@", cardsContent];
            }
            return @"Choose Nothing";
        }
    }
}

@end
