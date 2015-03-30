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
@property (weak, nonatomic) IBOutlet UILabel *gameDetailLabel;

@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardNumber:[self.cardButtons count]
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
    NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardButtonIndex];
    [self updateUI];
}

- (IBAction)redealButton:(UIButton *)sender
{
    [self redealUI];
    self.game = nil;
    self.gameDetailLabel.text = @"Choose Nothing";
    self.scoreLabel.text = @"Score : 0";
    
}

#pragma mark - Touch card button methods
- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
        self.gameDetailLabel.text = self.game.gameDetail;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %ld", (long)self.game.score];
    }
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

#pragma mark - Redeal button method
- (void)redealUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        if (!cardButton.enabled) {
            cardButton.enabled = YES;
        }
        if (card.isChosen) {
            card.chosen = NO;
            [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
            [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        }
    }
}


@end
