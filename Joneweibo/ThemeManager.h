//
//  ThemeManager.h
//  Joneweibo
//
//  Created by Jone on 14-2-23.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThemeDidChangeNofication @"kThemeDidChangeNofication"

@interface ThemeManager : NSObject

@property(nonatomic,retain)NSString *themeName;
@property(nonatomic,retain)NSDictionary *themePlist;

+ (ThemeManager *)shareInstance;
//返回当前主题下，主题图片对于的图片名
- (UIImage *)getThemeImage:(NSString *)imageName;
@end
