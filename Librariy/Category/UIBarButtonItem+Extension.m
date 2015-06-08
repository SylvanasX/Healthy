//
//  UIBarButtonItem+Extension.m
//  测试使用侧边栏
//
//  Created by student on 15/6/8.
//  Copyright (c) 2015年 风之翼. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)

+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action {
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    btn.size = btn.currentBackgroundImage.size;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

@end
