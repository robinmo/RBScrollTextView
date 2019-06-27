//
//  RBScrollTextView.m
//  ScrollTextView
//
//  Created by Robin on 2019/6/27.
//  Copyright © 2019 MOZZZ Co.,LTD. All rights reserved.
//

#import "RBScrollTextView.h"

@interface RBScrollTextView ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation RBScrollTextView

static CGFloat const DefaultScrollPtps = 2;

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    _contentLabel = [[UILabel alloc] init];
    [self addSubview:_contentLabel];
    self.layer.masksToBounds = YES;
    self.scrollPtps = DefaultScrollPtps;
    
}

- (void)setText:(NSString *)text {
    _text = text;
    [self layoutIfNeeded];
    _contentLabel.text = text;
    [_contentLabel sizeToFit];
    CGRect frame = _contentLabel.frame;
    frame.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(frame))/2;
    frame.origin.x = CGRectGetWidth(self.bounds);
    _contentLabel.frame = frame;
    [self scroll];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _contentLabel.font = font;
}

- (void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    _contentLabel.font = [UIFont systemFontOfSize:fontSize];
}

- (void)setScrollPtps:(CGFloat)speed {
    _scrollPtps = speed ?: DefaultScrollPtps;
    [self scroll];
}

- (void)setTextColor:(UIColor *)textColor {
    _contentLabel.textColor = textColor;
}

- (void)scroll {
    CGFloat sizeWidth = CGRectGetWidth(_contentLabel.frame);
    CGFloat x = CGRectGetMinX(_contentLabel.frame);
    [self.contentLabel.layer removeAnimationForKey:@"keyFrame"];
    
    if (sizeWidth<= self.bounds.size.width) {
        _contentLabel.center = self.center;
        return;
    }
    
    CAKeyframeAnimation* keyFrame = [CAKeyframeAnimation animation];
    keyFrame.keyPath = @"transform.translation.x";
    CGFloat scrollLength = sizeWidth + x;
    keyFrame.values = @[@(0), @(-scrollLength)];
    keyFrame.repeatCount = NSIntegerMax;
    keyFrame.autoreverses = NO;
    keyFrame.duration =  scrollLength * 0.025 / _scrollPtps;
    keyFrame.removedOnCompletion = NO;
    [self.contentLabel.layer addAnimation:keyFrame forKey:@"keyFrame"];
}

@end
