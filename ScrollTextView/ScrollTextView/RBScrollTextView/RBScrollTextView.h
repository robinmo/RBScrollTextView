//
//  RBScrollTextView.h
//  ScrollTextView
//
//  Created by Robin on 2019/6/27.
//  Copyright © 2019 MOZZZ Co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface RBScrollTextView : UIView

/** scroll points per second
 *  每秒钟滚动的pt数
 */
@property (nonatomic, assign) IBInspectable CGFloat scrollPtps;
@property (nonatomic, copy) IBInspectable NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) IBInspectable CGFloat fontSize;
@property (nonatomic, strong) IBInspectable UIColor *textColor;

@end

NS_ASSUME_NONNULL_END
