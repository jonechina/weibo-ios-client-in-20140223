//
//  ThemeButton.h
//  Joneweibo
//
//  Created by Jone on 14-2-23.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *highligtImageName;

@property(nonatomic,copy)NSString *backgroundImageName;
@property(nonatomic,copy)NSString *backgroundHighligtImageName;

- (id)initWithImage:(NSString *)imageName
         highlighte:(NSString *)highligtImageName;

- (id)initWithBackground:(NSString *)backgroundImageName
   highlightedBackground:(NSString *)backgroundHighligtImageName;

@end
