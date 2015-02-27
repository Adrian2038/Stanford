//
//  ViewController.m
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardNumber:self.cardButtons.count
                                                    withDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardButtonIndex];
    [self updateUI];
}

- (void)updateUI
{
    
}




@end
