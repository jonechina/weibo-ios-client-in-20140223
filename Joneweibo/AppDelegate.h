//
//  AppDelegate.h
//  Joneweibo
//
//  Created by Jone on 14-2-18.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SinaWeibo;
@class MainViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain)SinaWeibo *sinaweibo;
@property (nonatomic,retain)MainViewController *mainCtrl;

@end
