//
//  NewModelTool.h
//  测试使用侧边栏
//
//  Created by student on 15/6/7.
//  Copyright (c) 2015年 风之翼. All rights reserved.
//

#import <Foundation/Foundation.h>
@class newModel;
@interface NewModelTool : NSObject

/**
 *  在数据库中保存一个模型
 */
+ (void)saveNewModel:(newModel *)model;

+ (NSArray *)newModelsFromDB:(int)page;
@end
