//
//  AppDelegate.m
//  Joneweibo
//
//  Created by Jone on 14-2-18.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DDMenuController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "SinaWeibo.h"
#import "CONSTS.h"

@implementation AppDelegate

//初始化微博对象
- (void)_initSinaWeibo {
    _sinaweibo = [[SinaWeibo alloc] initWithAppKey:kAppKey appSecret:kAppSecret appRedirectURI:kAppRedirectURI
                                       andDelegate:_mainCtrl];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *sinaweiboInfo = [defaults objectForKey:@"SinaWeiboAuthData"];
    if ([sinaweiboInfo objectForKey:@"AccessTokenKey"] && [sinaweiboInfo objectForKey:@"ExpirationDateKey"] && [sinaweiboInfo objectForKey:@"UserIDKey"])
    {
        _sinaweibo.accessToken = [sinaweiboInfo objectForKey:@"AccessTokenKey"];
        _sinaweibo.expirationDate = [sinaweiboInfo objectForKey:@"ExpirationDateKey"];
        _sinaweibo.userID = [sinaweiboInfo objectForKey:@"UserIDKey"];
    }
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    _mainCtrl = [[MainViewController alloc] init];
    LeftViewController *leftCtrl = [[LeftViewController alloc] init];
    RightViewController *rightCtrl = [[RightViewController alloc] init];
    
    DDMenuController *menuCtrl = [[DDMenuController alloc] initWithRootViewController:_mainCtrl];
    menuCtrl.leftViewController = leftCtrl;
    menuCtrl.rightViewController = rightCtrl;

    [self _initSinaWeibo];    
    
    self.window.rootViewController = menuCtrl;

    [menuCtrl release];

    return YES;
} 

@end
