//
//  DropitBehavior.h
//  Dropit
//
//  Created by Adrian on 15/6/18.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
