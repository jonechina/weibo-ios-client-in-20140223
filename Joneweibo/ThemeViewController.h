//
//  ThemeViewController.h
//  Joneweibo
//
//  Created by Jone on 14-2-25.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "BaseViewController.h"

@interface ThemeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{

    NSArray *themes;
    
}



@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
