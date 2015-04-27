//
//  SetCard.m
//  Matchismo
//
//  Created by Adrian on 15/3/1.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

#pragma mark - color

@synthesize color = _color;

+ (NSArray *)validColor
{
    return @[[UIColor redColor], [UIColor greenColor], [UIColor purpleColor]];
}

- (void)setColor:(UIColor *)color
{
    if ([[SetCard validColor] containsObject:color]) {
        _color = color;
    }
}

- (UIColor *)color
{
    return _color ? _color : nil;
}

#pragma mark - number

+ (NSArray *)validNumber
{
    return @[@1, @2, @3];
}

+ (NSUInteger)maxNumber
{
    return [[SetCard validNumber] count];
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
    return @[@"▲",@"●",@"■"];
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
    return @[@-1, @0, @1];
}

@end
