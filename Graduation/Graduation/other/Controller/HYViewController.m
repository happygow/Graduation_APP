//
//  HYViewController.m
//  freelife
//
//  Created by LeeBruce on 16/10/21.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import "HYViewController.h"

@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"XMGTestViewController";
    //self.view.backgroundColor = [UIColor redColor];

   }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor colorWithDisplayP3Red:200 green:100 blue:50 alpha:1];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
