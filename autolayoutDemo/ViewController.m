//
//  ViewController.m
//  autolayoutDemo
//
//  Created by 孔凡伍 on 15/5/12.
//  Copyright (c) 2015年 kongfanwu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *button1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     Content Hugging Priority代表控件拒绝拉伸的优先级。优先级越高，控件会越不容易被拉伸。
     内容吸附： 内容吸附向内挤压视图，尽量靠近视图的内容大小以匹配该内容的自然大小，并且避免填充和伸展
     
     Content Compression Resistance Priority代表控件拒绝压缩内置空间的优先级。优先级越高，控件的内置空间会越不容易被压缩。
     压缩阻力将视图的大小与其内在内容大小相匹配，防止视图剪切其内容
     压缩阻力优先级较低时，视图最终可能会裁剪其内容。
     */
    
    // Do any additional setup after loading the view, typically from a nib.
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button1.backgroundColor = [UIColor orangeColor];
    _button1.translatesAutoresizingMaskIntoConstraints = NO;
    [_button1 setTitle:@"button 1 button 2" forState:UIControlStateNormal];
    [_button1 sizeToFit];
    [self.view addSubview:_button1];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:50.0f];
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:100.0f];
    [self.view addConstraint:constraint];
    
    
    /* 优先级比 constraint.priority = 750.0f; 高。所以 _button1 size 保持内在内容大小
     */
//    constraint = [NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10.0f];
//    constraint.priority = 750.0f;
//    [self.view addConstraint:constraint];
//    [_button1 setContentHuggingPriority:751 forAxis:UILayoutConstraintAxisHorizontal];
    
    /* 压缩阻力： UILayoutPriorityDefaultHigh + 1 比 750.0f 高 所有保持内在内容大小
     */
    constraint = [NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-250.0f];
    constraint.priority = 750.0f;
    [self.view addConstraint:constraint];
    
    [_button1 setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh + 1 forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
