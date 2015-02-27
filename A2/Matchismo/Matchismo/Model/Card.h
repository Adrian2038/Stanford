//
//  Card.h
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)cards;

@end
