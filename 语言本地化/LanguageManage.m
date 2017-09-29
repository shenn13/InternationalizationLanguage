//
//  LanguageManage.m
//  语言本地化
//
//  Created by 沈增光 on 2017/9/18.
//  Copyright © 2017年 沈增光. All rights reserved.
//

#import "LanguageManage.h"

#define CNS @"zh-Hans" 
#define EN @"en"
#define LANGUAGE_SET @"langeuageset"
#import "AppDelegate.h"

#import "ViewController.h"

static LanguageManage *sharedModel;
@interface LanguageManage()
@property(nonatomic,strong)NSBundle *bundle;
@property(nonatomic,copy)NSString *language;
@end



@implementation LanguageManage

+(id)sharedInstance {
    if (!sharedModel){
        sharedModel = [[LanguageManage alloc]init];
    }
    return sharedModel;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initLanguage];
    }
    return self;
}
-(void)initLanguage {
    
    NSString *tmp = [[NSUserDefaults standardUserDefaults]objectForKey:LANGUAGE_SET];
    NSString *path;
    //默认是中文
    if (!tmp) {
        tmp = CNS;
    } else {
        tmp = EN;
    }
    self.language = tmp;
    path = [[NSBundle mainBundle]pathForResource:self.language ofType:@"lproj"];
    self.bundle = [NSBundle bundleWithPath:path];
}
-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table {
    if (self.bundle) {
        
        return NSLocalizedStringFromTableInBundle(key, table, self.bundle, @"");
    }
    return NSLocalizedStringFromTable(key, table, @"");
}
-(void)changeNowLanguage {
    if ([self.language isEqualToString:EN]) {
        
        [self setNewLanguage:CNS];
    } else {
        [self setNewLanguage:EN];
    }
}
-(void)setNewLanguage:(NSString *)language {
    if ([language isEqualToString:self.language]) {
        
        return;
        
    } if ([language isEqualToString:EN] || [language isEqualToString:CNS]) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    NSLog(@"=====%@===%@",language,self.bundle);
    
    self.language = language;
    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
    [[NSUserDefaults standardUserDefaults]synchronize]; [self resetRootViewController]; }
//重新设置
-(void)resetRootViewController {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    ViewController *vc = [ViewController new];
    
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    appDelegate.window.rootViewController = naVC;
    
    [appDelegate.window makeKeyAndVisible];
    
}


@end
