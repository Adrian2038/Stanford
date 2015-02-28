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
@property (nonatomic, readonly) NSString *gameDetail;
@property (nonatomic, assign) BOOL useThreeMatchStyle;

- (instancetype)initWithCardNumber:(NSUInteger)number withDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
