//
//  MoreViewController.h
//  Joneweibo
//
//  Created by Jone on 14-2-20.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
