//
//  ViewController.m
//  changeLanguageInapp
//
//  Created by leo on 17/3/6.
//  Copyright © 2017年 huashen. All rights reserved.
//

#import "ViewController.h"
#define UserLanguage @"userLanguage"

@interface ViewController ()

@property(nonatomic,copy)NSString *sourcePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *language = [[NSUserDefaults standardUserDefaults] valueForKey:UserLanguage];
    
    if (!language) {
        
        // 用户未设置偏好语言
        
        // 获取系统当前语言版本（中文为：zh-Hans  英文：en）
      NSArray  *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        language = languages[0];
        [[NSUserDefaults standardUserDefaults] setValue:language forKey:UserLanguage];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
    // 从bundle 中获取字符串并打印
    NSString *string1 = [bundle localizedStringForKey:@"测试文字" value:nil table:@"myinfo"];
    NSString *string2 = [bundle localizedStringForKey:@"切换语言" value:nil table:@"myinfo"];
    
    // 应用内切换系统语言
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
