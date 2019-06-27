//
//  RBCodeViewController.m
//  ScrollTextView
//
//  Created by Robin on 2019/6/27.
//  Copyright © 2019 MOZZZ Co.,LTD. All rights reserved.
//

#import "RBCodeViewController.h"
#import "RBScrollTextView/RBScrollTextView.h"


@interface RBCodeViewController ()

@end

@implementation RBCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    RBScrollTextView *scrollTextView = [[RBScrollTextView alloc] initWithFrame: CGRectMake(10, 100, 200, 60)];
    scrollTextView.text = @"这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text";
    scrollTextView.center = self.view.center;
    scrollTextView.backgroundColor = [UIColor purpleColor];
    scrollTextView.textColor = [UIColor whiteColor];
    scrollTextView.scrollPtps = 6;
    [self.view addSubview:scrollTextView];
    
    RBScrollTextView *s2 = [[RBScrollTextView alloc] initWithFrame: scrollTextView.frame];
    s2.text = @"这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text这是一段水平滚动的文字。Here is a piece of scrolling text";
    
    CGRect frame = s2.frame;
    frame.origin = CGPointMake(CGRectGetMinX(scrollTextView.frame), CGRectGetMaxY(scrollTextView.frame) + 10);
    s2.frame = frame;
    
    s2.backgroundColor = [UIColor grayColor];
    s2.textColor = [UIColor whiteColor];
    s2.scrollPtps = 3;
    [self.view addSubview:s2];
}


@end
