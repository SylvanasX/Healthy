//
//  UIBarButtonItem+Extension.h
//  测试使用侧边栏
//
//  Created by student on 15/6/8.
//  Copyright (c) 2015年 风之翼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target action:(SEL)action;

@end
