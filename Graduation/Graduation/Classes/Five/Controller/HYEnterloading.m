//
//  HYEnterloading.m
//  Graduation
//
//  Created by LeeBruce on 17/4/11.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYEnterloading.h"
#import "WSLoginView.h"
@interface HYEnterloading ()

@end

@implementation HYEnterloading

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}

- (void)createView
{
    WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
    wsLoginV.titleLabel.text = @"我是一只调皮的猫头鹰";
    wsLoginV.titleLabel.textColor = [UIColor grayColor];
    wsLoginV.hideEyesType = NOEyesHide;//遮挡眼睛类型
    [self.view addSubview:wsLoginV];
    UITapGestureRecognizer *login = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [wsLoginV addGestureRecognizer:login];
    [wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {
        
        
        
//        NSLog(@"点击了登录按钮textField1 = %@   textField2 = %@",textField1Text,textField2Text);
//        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"登录按钮事件" message:[NSString stringWithFormat:@"账号：%@\n密码：%@",textField1Text,textField2Text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alertV show];
         [self dismissViewControllerAnimated:YES completion:nil];
    }];
}



@end
