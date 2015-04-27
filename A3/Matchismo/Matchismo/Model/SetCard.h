//
//  SetCard.h
//  Matchismo
//
//  Created by Adrian on 15/3/1.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "Card.h"
#import <UIKit/UIKit.h>

@interface SetCard : Card

@property (nonatomic, strong) UIColor  *color;
@property (nonatomic, assign) NSInteger shading;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, assign) NSUInteger number;

+ (NSArray *)validColor;
+ (NSArray *)validSymbol;
+ (NSArray *)validShading;
+ (NSArray *)validNumber;
+ (NSUInteger)maxNumber;

@end
