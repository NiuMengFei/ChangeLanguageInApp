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

/*
 所有支持的语种类型
 */
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

    [self settingBthTitle];
}

-(void)settingBthTitle{
 
    NSString *localizedstr1 = [ChangeLanguage getLocalizedStringWithKey:@"中文" table:@"myinfo"];
    NSString *localizedstr2 = [ChangeLanguage getLocalizedStringWithKey:@"英文" table:@"myinfo"];
    
    [self.chinese setTitle:localizedstr1 forState:UIControlStateNormal];
    [self.english setTitle:localizedstr2 forState:UIControlStateNormal];
}

-(void)viewWillDisappear:(BOOL)animated{

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userLanguage"];
}





@end
