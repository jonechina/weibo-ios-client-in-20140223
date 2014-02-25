//
//  ThemeButton.m
//  Joneweibo
//
//  Created by Jone on 14-2-23.
//  Copyright (c) 2014年 xuqiang. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"

@implementation ThemeButton


- (id)initWithImage:(NSString *)imageName highlighte:(NSString *)highligtImageName {
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.highligtImageName = highligtImageName;
    }
    return self;
}
- (id)initWithBackground:(NSString *)backgroundImageName highlightedBackground:(NSString *)backgroundHighligtImageName {
    self = [self init];
    if (self) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHighligtImageName = backgroundHighligtImageName;
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)themeNotification:(NSNotification *)notification {
    [self loadImage];
}

- (void)loadImage {
    ThemeManager *themeManage = [ThemeManager shareInstance];
    UIImage *image = [themeManage getThemeImage:_imageName];
    UIImage *highligtImage = [themeManage getThemeImage:_highligtImageName];
    
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highligtImage forState:UIControlStateHighlighted];
    
    UIImage *backImage = [themeManage getThemeImage:_backgroundImageName];
    UIImage *backHighlightImage = [themeManage getThemeImage:_backgroundHighligtImageName];
    
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
}

#pragma mark - setter
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        [_imageName release];
        _imageName = [imageName copy];
    }
    [self loadImage];
}

-(void)setBackgroundImageName:(NSString *)highligtImageName {
    if (_backgroundImageName != _backgroundImageName) {
        [_backgroundImageName release];
        _backgroundImageName = [_backgroundImageName copy];
    }
    [self loadImage];
}



-(void)setBackgroundHighligtImageName:(NSString *)backgroundHighligtImageName {
    if (_backgroundHighligtImageName != _backgroundHighligtImageName) {
        [_backgroundHighligtImageName release];
        _backgroundHighligtImageName = [backgroundHighligtImageName copy];
    }
    [self loadImage];
}

@end
