//
//  SetCard.h
//  Matchismo
//
//  Created by Adrian on 15/3/1.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSAttributedString *shading;
@property (nonatomic, assign) NSUInteger number;

@end
