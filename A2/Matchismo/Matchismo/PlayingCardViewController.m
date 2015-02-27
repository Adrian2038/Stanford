//
//  PlayingCardViewController.m
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
