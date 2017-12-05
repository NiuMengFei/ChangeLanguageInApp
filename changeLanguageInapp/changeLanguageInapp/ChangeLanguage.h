//
//  ChangeLanguage.h
//  changeLanguageInapp
//
//  Created by leo on 17/3/7.
//  Copyright © 2017年 huashen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeLanguage : NSObject

// 初始化设置本地语言
+(instancetype)sharedLanguageTool;

// 获取当前的语言类型
+(NSString *)getCurrentLanguage;

// 切换语言类型
+(void)changeLanguageInto:(NSString *)newLanguage;

// 获取设置后的语言
+(NSString *)getLocalizedStringWithKey:(NSString *)key table:(NSString *)table;
@end
