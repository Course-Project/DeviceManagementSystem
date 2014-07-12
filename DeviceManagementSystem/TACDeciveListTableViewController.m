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
    TACDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - UITableViewDelegate

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TACDeviceBorrowViewController *vc = segue.destinationViewController;
    vc.deviceModel = ((TACDeviceTableViewCell *)sender).deviceModel;
}

@end
