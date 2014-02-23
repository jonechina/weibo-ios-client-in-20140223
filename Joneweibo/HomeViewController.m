//
//  HomeViewController.m
//  Joneweibo
//
//  Created by Jone on 14-2-18.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"微博";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //绑定登陆按钮
    UIBarButtonItem *bingItem = [[UIBarButtonItem alloc] initWithTitle:@"绑定帐号" style:UIBarButtonItemStyleBordered target:self action:@selector(bindAction:)];
    self.navigationItem.rightBarButtonItem = [bingItem autorelease];
    
    //注销按钮
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutAction:)];
    self.navigationItem.leftBarButtonItem = [logoutItem autorelease];
    
    //判断是否登陆认证
    if (self.sinaweibo.isAuthValid) {
        //加载微博列表数据
        [self loadWeiboData];
    }
    
    
}

#pragma mark - load data
- (void)loadWeiboData {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"5" forKey:@"count"];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" delegate:self];
}


#pragma mark - SinaWeiboRequest delegate
//网络加载失败
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"网络加载失败:%@",error);

}
//网络加载完成
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result {
    NSLog(@"%@",request);
}

#pragma mark - actions
- (void)bindAction:(UIBarButtonItem *)buttonItem {
    [self.sinaweibo logIn];
}

- (void)logoutAction:(UIBarButtonItem *)buttonItem {
    [self.sinaweibo logOut];
}

#pragma mark - memery Manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidUnload {

}
@end
