//
//  CollectViewController.m
//  测试使用侧边栏
//
//  Created by student on 15/6/8.
//  Copyright (c) 2015年 风之翼. All rights reserved.
//

#import "CollectViewController.h"
#import <RETableViewManager.h>

@interface CollectViewController ()

@property (nonatomic, strong) RETableViewManager *mgr;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收藏";
    [self setupTableViewManager];
    [self setupNewSection];
}

- (void)setupTableViewManager {
    RETableViewManager *mgr = [[RETableViewManager alloc] initWithTableView:self.tableView];
    mgr.style.defaultCellSelectionStyle = UITableViewCellSelectionStyleNone;
    self.mgr = mgr;
}


/**
 *  添加资讯收藏section
 */
- (void)setupNewSection {
    RETableViewSection *section = [RETableViewSection section];
    RETableViewItem *newItem = [RETableViewItem itemWithTitle:@"资讯收藏"];
    [section addItem:newItem];
    RETableViewItem *timeItem = [RETableViewItem itemWithTitle:@"常识收藏"];
    [section addItem:timeItem];
    RETableViewItem *foodItem = [RETableViewItem itemWithTitle:@"食谱收藏"];
    [section addItem:foodItem];
    [self.mgr addSection:section];
    
    newItem.selectionHandler = ^(RETableViewItem *item) {
        
    };
    
    timeItem.selectionHandler = ^(RETableViewItem *item) {
        
    };
    
    foodItem.selectionHandler = ^(RETableViewItem *item) {
    
    };
}

- (instancetype)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
    }
    return self;
}
@end
