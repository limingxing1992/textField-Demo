//
//  ViewController.m
//  textField动画Demo
//
//  Created by qianfeng on 15/12/1.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *myTextFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTextFiled.delegate = self;
    
    //通知中心注册键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onMove:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRemove:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ------------------------------监听键盘弹出和退出
-(void)onMove:(NSNotification *)fication
{
    [UIView animateWithDuration:0.2 animations:^{
        self.myTextFiled.transform = CGAffineTransformMakeTranslation(0, -300);
    }];
}

-(void)onRemove:(NSNotification *)fication
{
    [UIView animateWithDuration:0.2 animations:^{
        self.myTextFiled.transform = CGAffineTransformIdentity;
    }];
}
#pragma mark ------------------------------点击屏幕事件
//点击屏幕撤回键盘和输入
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.myTextFiled resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //此处发送评论
    NSLog(@"1212");
    return YES;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
