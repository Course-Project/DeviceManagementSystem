//
//  TACDeciveListTableViewController.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/6/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeciveListTableViewController.h"
#import "TACDeviceTableViewCell.h"
#import "TACDeviceModel.h"
#import "TACDeviceAddTableViewController.h"
#import "TACDeviceBorrowViewController.h"

@interface TACDeciveListTableViewController ()

@end

@implementation TACDeciveListTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI Methods
    [self configureNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 重新加载数据
    [self.tableView reloadData];
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    // 为navigationBar添加右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(addDeviceCell)];
}

#pragma mark - Actions
- (void)addDeviceCell {
    TACDeviceAddTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DeviceAddTableViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[TACDataModel sharedDataModel] deviceArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TACDeviceModel *deviceModel = [[TACDataModel sharedDataModel] getDeviceAtIndex:indexPath.row];
    TACDeviceTableViewCell *cell = nil;
    
    if ([deviceModel isBorrowed]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"BorrowedDeviceCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell" forIndexPath:indexPath];
    }
    
    cell.deviceModel = deviceModel;
    
    cell.deviceNameLabel.text = deviceModel.deviceName;
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TACDeviceBorrowViewController *vc = segue.destinationViewController;
    vc.deviceModel = ((TACDeviceTableViewCell *)sender).deviceModel;
}

@end
