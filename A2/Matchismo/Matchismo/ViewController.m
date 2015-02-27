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
@property (nonatomic, assign) NSInteger segmentState;

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
    if (self.segmentState == 1) {
        self.game.useThreeMatchStyle = YES;
    }
    
    int cardButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardButtonIndex];
    [self updateUI];
}

- (IBAction)redealButton:(UIButton *)sender
{
    [self redealUI];
    self.game = nil;
    self.scoreLabel.text = @"Score : 0";
}

- (IBAction)changeMatchStyle:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        self.game.useThreeMatchStyle = NO;
        self.segmentState = 0;
    } else {
        self.game.useThreeMatchStyle = YES;
        self.segmentState = 1;
    }
}

#pragma mark - Touch card button methods
- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
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
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
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
