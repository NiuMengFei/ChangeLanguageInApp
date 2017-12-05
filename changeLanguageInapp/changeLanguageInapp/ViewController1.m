//
//  ViewController1.m
//  changeLanguageInapp
//
//  Created by leo on 17/3/6.
//  Copyright © 2017年 huashen. All rights reserved.
//

#import "ViewController1.h"
#import "AppDelegate.h"
#import "TabbarController.h"

#define Chinese      @"zh-Hans"
#define English      @"en"
#define UserLanguage @"userLanguage"



#import "ChangeLanguage.h"

@interface ViewController1 ()

@property(nonatomic,copy)NSString *sourcePath;

@end

@implementation ViewController1

- (IBAction)chinese:(UIButton *)sender {
    
    // 将所有的页面替换掉 所有的页面都会重新加载
    [ChangeLanguage changeLanguageInto:Chinese];
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *delegate = application.delegate ;
    delegate.window.rootViewController = nil ;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TabbarController *viewcon = [storyboard instantiateViewControllerWithIdentifier:@"TabbarController"];
    delegate.window.rootViewController = viewcon ;
    
}

- (IBAction)english:(UIButton *)sender {
    
   // 英文
    [ChangeLanguage changeLanguageInto:English];
    UIApplication *application = [UIApplication sharedApplication];
    AppDelegate *delegate = application.delegate ;
    delegate.window.rootViewController = nil ;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TabbarController *viewcon = [storyboard instantiateViewControllerWithIdentifier:@"TabbarController"];
    delegate.window.rootViewController = viewcon ;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    [ChangeLanguage sharedLanguageTool];
    
    
    NSString *currentLanguage = [ChangeLanguage getCurrentLanguage];
    NSString *localizedstr1 = [ChangeLanguage getLocalizedStringWithKey:@"测试文字" table:@"myinfo"];
    NSString *localizedstr2 = [ChangeLanguage getLocalizedStringWithKey:@"切换语言" table:@"myinfo"];
    
    // 真机
    // zh-Hans-CN 中文环境
    // en-CN      英文环境
    
    // 模拟器
    //
    // zh-Hans-US 中文环境
    // en-US      英文环境
    
#if 0
    NSString *language = [[NSUserDefaults standardUserDefaults] valueForKey:UserLanguage];
    
    if (!language) {
        
        // 用户未设置偏好语言
        
        // 获取系统当前语言版本（中文为：zh-Hans  英文：en）
        NSArray  *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        language = languages[0];
        
        if ([language hasPrefix:Chinese]) {
            
            language = Chinese ;
        }else{
          
            language = English ;
        }
        
        
        [[NSUserDefaults standardUserDefaults] setValue:language forKey:UserLanguage];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
    // 从bundle 中获取字符串并打印
    NSString *string1 = [bundle localizedStringForKey:@"测试文字" value:nil table:@"myinfo"];
    NSString *string2 = [bundle localizedStringForKey:@"切换语言" value:nil table:@"myinfo"];
    
    NSLog(@"xxxxxxxxxxxxxx%@",string1);
    NSLog(@"kkkkkkkkkkkkkk%@",string2);
    
#endif
    
    [self custemSettingTextField];
    
}

-(void)custemSettingTextField{
 
    NSString *localizedstr1 = [ChangeLanguage getLocalizedStringWithKey:@"中文" table:@"myinfo"];
    NSString *localizedstr2 = [ChangeLanguage getLocalizedStringWithKey:@"英文" table:@"myinfo"];
    
    [self.chinese setTitle:localizedstr1 forState:UIControlStateNormal];
    [self.english setTitle:localizedstr2 forState:UIControlStateNormal];
}

-(void)test{

    NSString *language = [[NSUserDefaults standardUserDefaults] valueForKey:UserLanguage];
    
    // 真机
    // zh-Hans-CN 中文环境
    // en-CN      英文环境
    
    // 模拟器
    //
    // zh-Hans-US 中文环境
    // en-US      英文环境
    
    if (!language) {
        
        // 用户未设置偏好语言
        
        // 获取系统当前语言版本（中文为：zh-Hans  英文：en）
        NSArray  *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        language = languages[0];
        
        if ([language hasPrefix:Chinese]) {
            
            language = Chinese ;
        }else{
            
            language = English ;
        }
        
        
        [[NSUserDefaults standardUserDefaults] setValue:language forKey:UserLanguage];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    
    // 从bundle 中获取字符串并打印
    NSString *string1 = [bundle localizedStringForKey:@"测试文字" value:nil table:@"myinfo"];
    NSString *string2 = [bundle localizedStringForKey:@"切换语言" value:nil table:@"myinfo"];
    
    NSLog(@"xxxxxxxxxxxxxx%@",string1);
    NSLog(@"kkkkkkkkkkkkkk%@",string2);
    
    
    // 切换成语语言后 改变 UI 的方法
    // 所有的界面基于一个基类
    // 1 切换语言后发送通知 界面接收到通知后 改变所有添加到View 上的带文字的控件的UI
    // 2 重新加载RootVC
    
  
}

-(void)viewWillDisappear:(BOOL)animated{

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userLanguage"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
