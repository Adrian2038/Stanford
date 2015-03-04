//
//  SetCard.m
//  Matchismo
//
//  Created by Adrian on 15/3/1.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

// Just Test
- (NSString *)contents
{
    NSString *normalContents = [NSString stringWithFormat:@"%@%@%@", self.color, self.shading, self.symbol];
    NSArray *numberStrings = [SetCard numberStrings];
    return [numberStrings[self.number] stringByAppendingString:normalContents];
}

#pragma mark - color

@synthesize color = _color;

+ (NSArray *)validColor
{
    return @[@"red", @"green", @"purple"];
}

- (void)setColor:(NSString *)color
{
    if ([[SetCard validColor] containsObject:color]) {
        _color = color;
    }
}

- (NSString *)color
{
    return _color ? _color : @"?";
}

#pragma mark - number

+ (NSArray *)numberStrings
{
    return @[@"?", @"1", @"2", @"3"];
}

+ (NSUInteger)maxNumber
{
    return [[SetCard numberStrings] count] - 1;
}

- (void)setNumber:(NSUInteger)number
{
    if (number <= [SetCard maxNumber]) {
        _number = number;
    }
}

#pragma mark - symbol

@synthesize symbol = _symbol;

+ (NSArray *)validSymbol
{
    return @[@"diamond", @"squiggle", @"oval"];
}

- (void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbol] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (NSString *)symbol
{
    return _symbol ? _symbol : @"?";
}

#pragma mark - shading

@synthesize shading = _shading;

+ (NSArray *)validShading
{
    return @[@"solid", @"striped", @"open"];
}

- (void)setShading:(NSString *)shading
{
    if ([[SetCard validShading] containsObject:shading]) {
        _shading = shading;
    }
}

- (NSString *)shading
{
    return _shading ? _shading : @"?";
}

@end
