//
//  ViewController.m
//  InputContentDemo
//
//  Created by 纵昂 on 2017/3/4.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ViewController.h"
#import "ZAInptutView.h"//在view界面展示内容
#define WS(weakSelf)        __weak __typeof(&*self)weakSelf = self

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UIButton *button_popView;
@property (nonatomic,strong) ZAInptutView *view_inputView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"输入信息demo";
    
    [self inputContentSubviews];
    
    [self clickButtonPopInputView];

}
//输入信息
- (void) inputContentSubviews {
    UITextField *textField_input = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 40)];
    [self.view addSubview:textField_input];
    textField_input.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
    textField_input.layer.cornerRadius = 10.0;
    textField_input.clipsToBounds = YES;
    
    //设置距离输入框左侧间距
    textField_input.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
    textField_input.leftViewMode = UITextFieldViewModeAlways;
    
}

//点击弹出输入键盘按钮
- (void) clickButtonPopInputView {
    self.button_popView = [[UIButton alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 40)];
    [self.view addSubview:self.button_popView];
    self.button_popView.backgroundColor = [UIColor purpleColor];
    self.button_popView.layer.cornerRadius = 10.0;
    self.button_popView.clipsToBounds = YES;
    [self.button_popView setTitle:@"显示输入内容" forState:0];
    [self.button_popView.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.button_popView addTarget:self action:@selector(popInputSubview) forControlEvents:UIControlEventTouchUpInside];
}

//展示 弹出框的输入内容 ybh7
- (void) popInputSubview
{
    NSLog(@"hahah");
    
    WS(weakSelf);// 防止循环引用
    self.view_inputView = [[ZAInptutView alloc] initWithFrame:self.view.frame andTitle:@"请输入昵称" andPlaceHolderTitle:@"前部"];
    [self.view addSubview:self.view_inputView];
    
    self.view_inputView.removeView = ^(NSString *title){
        NSLog(@"hehehe--%@",title);
        
        [weakSelf.button_popView setTitle:title forState:0];
        
        [weakSelf.view_inputView removeFromSuperview];
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
