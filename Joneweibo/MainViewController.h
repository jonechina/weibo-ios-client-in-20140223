//
//  MainViewController.h
//  Joneweibo
//
//  Created by Jone on 14-2-18.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"

@interface MainViewController : UITabBarController <SinaWeiboDelegate> {

    UIView *_tabbarView;
    
}

@end
