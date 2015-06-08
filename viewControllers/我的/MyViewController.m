//
//  MyViewController.m
//  测试使用侧边栏
//
//  Created by 风之翼 on 15/5/4.
//  Copyright (c) 2015年 风之翼. All rights reserved.
//

#import "MyViewController.h"

#import "ZCControl.h"

#import "Const.h"

#import "MJRefresh.h"
#import "newModel.h"
#import "NewTableViewCell.h"
#import "NewModelTool.h"
#import "ConstNSNotification.h"
@interface MyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) int page;

@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =View_BackGround;
    self.title = @"收藏";
    // 添加tableView
    [self setupTableView];
    // 从数据库中加载数据
    [self loadDataFromDB];
    // 刷新tableView
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(collectChange:) name:collectNSNotification object:nil];
}

- (void)collectChange:(NSNotification *)notification {
//    NSDictionary *userInfo = notification.userInfo;
//    newModel *model = userInfo[collectModel];
//    if ([userInfo[isCollectKey] boolValue]) {
//        [self.models insertObject:model atIndex:0];
//    } else {
//        [self.models removeObject:model];
//    }
//    [self.tableView reloadData];
    [self.models removeAllObjects];
    self.page = 0;
    [self loadDataFromDB];
}

- (void)setupTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (NSMutableArray *)models {
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

- (void)loadDataFromDB {
    self.page++;
    [self.models addObjectsFromArray:[NewModelTool newModelsFromDB:self.page]];
    NSLog(@"%@", self.models);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    newModel *model = self.models[indexPath.row];
    cell.model = model;
    cell.pageType = NSPageTypeNewListController;
    [cell setCellValueforRowIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
