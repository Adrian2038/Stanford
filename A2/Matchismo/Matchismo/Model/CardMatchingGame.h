//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Adrian on 15/2/27.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

- (instancetype)initWithCardNumber:(NSUInteger)number withDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end