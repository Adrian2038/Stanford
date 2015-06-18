//
//  ViewController.m
//  Dropit
//
//  Created by Adrian on 15/6/18.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import "ViewController.h"
#import "DropitBehavior.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameVIew;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) DropitBehavior *dropBehavior;

@end

@implementation ViewController

- (UIDynamicAnimator *)animator
{
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameVIew];
    }
    return _animator;
}

- (DropitBehavior *)dropBehavior
{
    if (!_dropBehavior) {
        _dropBehavior = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropBehavior];
    }
    return _dropBehavior;
}

static const CGSize DROP_SIZE = {40, 40};

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}

- (void)drop
{
    CGRect frame ;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random() % (int)self.gameVIew.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameVIew addSubview:dropView];
    
    [self.dropBehavior addItem:dropView];
}

- (UIColor *)randomColor
{
    switch (arc4random() % 5)
    {
        case 0: return [UIColor redColor];
        case 1: return [UIColor greenColor];
        case 2: return [UIColor blueColor];
        case 3: return [UIColor purpleColor];
        case 4: return [UIColor orangeColor];
    }
    return [UIColor blackColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"self.view size = %@", NSStringFromCGSize(self.view.frame.size));
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
