//
//  LanguageManage.h
//  语言本地化
//
//  Created by 沈增光 on 2017/9/18.
//  Copyright © 2017年 沈增光. All rights reserved.
//

#import <Foundation/Foundation.h>


#define FGGetStringWithKeyFromTable(key, tbl) [[LanguageManage sharedInstance] getStringForKey:key withTable:tbl]


@interface LanguageManage : NSObject

+(id)sharedInstance;
/**
 *返回table中指定的key的值 *
 * @param key key 
 * @param table table 
 * @return 返回table中指定的key的值
 */

-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table;
/** 
 * 改变当前语言
 */
-(void)changeNowLanguage;
/** 
 * 设置新的语言 *
 * @param language 新语言 
 */
-(void)setNewLanguage:(NSString*)language;


@end
