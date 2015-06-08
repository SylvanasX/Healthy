//
//  NewModelTool.m
//  测试使用侧边栏
//
//  Created by student on 15/6/7.
//  Copyright (c) 2015年 风之翼. All rights reserved.
//

#import "NewModelTool.h"
#import "FMDB.h"
#import "newModel.h"
@implementation NewModelTool
static FMDatabase *_db;
+ (void)initialize {
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"list.sqlite"];
    NSLog(@"%@", file);
    _db = [FMDatabase databaseWithPath:file];
    if (![_db open]) return;
    
    // 创表
    // t_model为存放newModel模型的数据库表名
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_model(id integer PRIMARY KEY, newModel blob NOT NULL, newModelId text NOT NULL);"];
}

+ (void)saveNewModel:(newModel *)model {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    [_db executeUpdateWithFormat:@"INSERT INTO t_model(newModel, newModelId) VALUES(%@, %@);", data, model.Id];
}

+ (NSArray *)newModelsFromDB:(int)page {
    // 每次取20条
    int size = 20;
    // 每次在pos位置开始取
    int pos = (page - 1) * size;
    FMResultSet *set = [_db executeQueryWithFormat:@"SELECT * FROM t_model ORDER BY id LIMIT %d,%d", pos, size];
    NSMutableArray *array = [NSMutableArray array];
    while (set.next) {
        newModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:[set objectForColumnName:@"newModel"]];
        [array addObject:model];
    }
    return array;
}
    

@end
