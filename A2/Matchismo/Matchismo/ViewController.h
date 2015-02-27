//
//  ViewController.h
//  A1
//
//  Created by Adrian on 15/2/26.
//  Copyright (c) 2015年 zz. All rights reserved.
//
// User must implement the abstrct method DaDa


#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

// abstrct method
- (Deck *)createDeck;

@end

