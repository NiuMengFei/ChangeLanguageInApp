//
//  ChangeLanguage.m
//  changeLanguageInapp
//
//  Created by leo on 17/3/7.
//  Copyright © 2017年 huashen. All rights reserved.
//

#import "ChangeLanguage.h"

// 所支持的所有语言
#define Chinese @"zh-Hans"
#define English @"en"

// 用户应用内选择的语言类型
#define UserLanguage @"userLanguage"
static NSBundle *bundle ;


@implementation ChangeLanguage

static ChangeLanguage *changeLanguagetool ;

// 创建一个单例对象
+(instancetype)sharedLanguageTool{
    
    if (!changeLanguagetool) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            changeLanguagetool = [[ChangeLanguage alloc]init];
            [self settinglanguage];
        });
    }
    
    return changeLanguagetool ;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static id istance = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        istance = [super allocWithZone:zone];
    }); return istance ;
}



+(void)settinglanguage{

    NSString *language = [[NSUserDefaults standardUserDefaults] valueForKey:UserLanguage];
    if (!language) {
        
        NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        
        if (languages.count) {
            
            NSString *prefrelanguage = languages[0];
            if ([prefrelanguage hasPrefix:Chinese]) {
                
                language = Chinese ;
            }else{
            
                language = English ;
            }
        }else{
        
            // 没有偏好语言
            language = Chinese ;
        }
        
        [[NSUserDefaults standardUserDefaults] setValue:language forKey:UserLanguage];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}



// 获取当前的语言类型
+(NSString *)getCurrentLanguage{

    NSString *currentlanguage = [[NSUserDefaults standardUserDefaults] valueForKey:UserLanguage];
    return currentlanguage ;
}

// 切换语言类型
+(void)changeLanguageInto:(NSString *)newLanguage{

    NSString *currentLanguage = [self getCurrentLanguage];
    if ([currentLanguage isEqualToString:newLanguage]) {
        
        return ;
    }else{
    
        [[NSUserDefaults standardUserDefaults] setValue:newLanguage forKey:UserLanguage];
        NSLog(@"kkkkkkkkkk%@",[[NSUserDefaults standardUserDefaults] valueForKey:UserLanguage]);
        // 立即存储到默认设置中
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSString *path = [[NSBundle mainBundle] pathForResource:newLanguage ofType:@"lproj"];
        bundle = [NSBundle bundleWithPath:path];
    }
}

// 获取设置后的语言
+(NSString *)getLocalizedStringWithKey:(NSString *)key table:(NSString *)table{
  
    NSString *string = [bundle localizedStringForKey:key value:nil table:table];
    return string ;
}



@end
