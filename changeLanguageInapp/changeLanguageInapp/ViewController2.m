//
//  ViewController2.m
//  changeLanguageInapp
//
//  Created by leo on 17/3/6.
//  Copyright © 2017年 huashen. All rights reserved.
//

#import "ViewController2.h"
#import "ChangeLanguage.h"


@interface ViewController2 ()


@property (weak, nonatomic) IBOutlet UILabel *Label;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self custemSettingUI];
}
-(void)custemSettingUI{

    NSString *string = [ChangeLanguage getLocalizedStringWithKey:@"这里显示测试文字" table:@"myinfo"];
    self.Label.text = string ;
    NSLog(@"viewDidLoad") ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
