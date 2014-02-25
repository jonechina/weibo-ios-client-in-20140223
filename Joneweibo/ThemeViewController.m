//
//  ThemeViewController.m
//  Joneweibo
//
//  Created by Jone on 14-2-25.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "ThemeViewController.h"
#import "ThemeManager.h"

@interface ThemeViewController ()

@end

@implementation ThemeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        themes = [[ThemeManager shareInstance].themesPlist allKeys];
        [themes retain]; //themes是对象属性，必须通过retain拿到对象所有权，并持有
        self.title = @"主题切换";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return themes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"themecell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
    }
    cell.textLabel.text = themes[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *themeName = themes[indexPath.row];
    [ThemeManager shareInstance].themeName = themeName;
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNofication object:themeName];
}

@end
