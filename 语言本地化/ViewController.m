//
//  ViewController.m
//  语言本地化
//
//  Created by 沈增光 on 2017/9/18.
//  Copyright © 2017年 沈增光. All rights reserved.
//

#import "ViewController.h"
#import "LanguageManage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = FGGetStringWithKeyFromTable(@"PersonTitle", @"LanguageManage");
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    button.center = self.view.center;
    [button setTitle:FGGetStringWithKeyFromTable(@"NowLanguage", @"LanguageManage") forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor yellowColor]];
    
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:button.bounds.size.width/2]; //设置矩形四个圆角半径
    [button.layer setBorderWidth:4.0];
    button.layer.borderColor=[UIColor redColor].CGColor;
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


-(void)buttonClicked{
    
    [[LanguageManage sharedInstance] changeNowLanguage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
