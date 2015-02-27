//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Adrian on 15/2/17.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *colofulCharacters;
@property (weak, nonatomic) IBOutlet UILabel *underlineCharacters;

@end

@implementation TextStatsViewController

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI
{
    self.colofulCharacters.text = [NSString stringWithFormat:@"%d : coloful characters",
                                   [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.underlineCharacters.text = [NSString stringWithFormat:@"%d : underline characters",
                                     [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *charaters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    while (index < self.textToAnalyze.length) {
        NSRange range ;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [charaters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            index ++;
        }
    }
    
    return charaters;
}


@end
