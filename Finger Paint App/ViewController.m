//
//  ViewController.m
//  Finger Paint App
//
//  Created by Adam Goldberg on 2015-10-09.
//  Copyright (c) 2015 Adam Goldberg. All rights reserved.
//

#import "ViewController.h"
#import "FingerTouchView.h"

@interface ViewController ()

@property (nonatomic, strong) FingerTouchView *fingerTouchView;

@property (nonatomic, strong) UISegmentedControl *seg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fingerTouchView = [[FingerTouchView alloc] init];
    self.fingerTouchView.backgroundColor = [UIColor yellowColor];
    
    
    self.view = self.fingerTouchView;
    
    NSArray *colors = @[@"Red", @"Blue", @"Green", @"Orange", @"Eraser"];
    
    self.seg = [[UISegmentedControl alloc] initWithItems:colors];
    self.seg.selectedSegmentIndex = 0;
    [self changeColor:self.seg];
    [self.seg addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.seg];
    
}


-(void)viewDidLayoutSubviews {
    
    CGPoint p = CGPointMake(self.view.center.x, self.seg.bounds.size.height + 20);
    self.seg.center = p;
    
    
}

- (void)changeColor:(UISegmentedControl *)sender {
   
    // get text title value
    // send this to self.view
    NSString *color =[self.seg titleForSegmentAtIndex:self.seg.selectedSegmentIndex];
    if ([color isEqualToString:@"Eraser"]) {
        color = @"yellow";
    }
    [self.fingerTouchView setCustomColourString:color];
}


@end
