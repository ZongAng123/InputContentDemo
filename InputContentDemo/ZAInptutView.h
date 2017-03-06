//
//  ZAInptutView.h
//  InputContentDemo
//
//  Created by 纵昂 on 2017/3/4.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^removeCoverAndInputView)(NSString *inputContent);

@interface ZAInptutView : UIView
@property (nonatomic,copy) removeCoverAndInputView removeView;
/**
 *输入内容 界面布局 文字传播
 */
- (id) initWithFrame:(CGRect)frame andTitle:(NSString *)title andPlaceHolderTitle:(NSString *)palceContent;

@end
