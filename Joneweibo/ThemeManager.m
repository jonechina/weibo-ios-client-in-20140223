//
//  ThemeManager.m
//  Joneweibo
//
//  Created by Jone on 14-2-23.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "ThemeManager.h"


static ThemeManager *sigleton = nil;

@implementation ThemeManager

+ (ThemeManager *)shareInstance {
    if (sigleton == nil) {
        @synchronized(self){
        sigleton = [[ThemeManager alloc] init];
    }
    }
    return sigleton;  //之前未出现切换界面，因为这边填的是nil

}

//初始化Plist文件
- (id)init {
    self = [super init];
    if (self) {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
        
        //默认为空
        self.themeName = nil;
        
    }
    return self;
}

//获取主题路径方法
- (NSString *)getThemePath {
    if (self.themeName == nil) {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    
    //获取主题路径
    NSString *themePath = [self.themesPlist objectForKey:_themeName];
    //程序包路径
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    //完整的主题包路径
    NSString *path = [resourcePath stringByAppendingPathComponent:themePath];
                      
    return path;
}

//返回当前主题下，主题图片对于的图片名
- (UIImage *)getThemeImage:(NSString *)imageName {
    if (imageName.length == 0) {
        return nil;
    }
    //获取主题目录
    NSString  *themePath = [self getThemePath];
    //imageName在当前主题的路径
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
    
}

#pragma mark - sengleton setting
+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sigleton == nil) {
            sigleton = [super allocWithZone:zone];
        }
    }
    return sigleton;
}

+ (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;
}

- (oneway void)release {

}

- (id)autorelease {
    return self;
}

@end


