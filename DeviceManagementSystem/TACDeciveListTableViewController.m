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

@interface TACDeciveListTableViewController ()

@property (nonatomic, strong) NSMutableArray *deviceArray;
@property (nonatomic, strong) NSMutableArray *borrowedDeviceArray;

@end

@implementation TACDeciveListTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Properties
- (NSMutableArray *)deviceArray {
    if (!_deviceArray) {
        _deviceArray = [[NSMutableArray alloc] init];
    }
    return _deviceArray;
}

- (NSMutableArray *)borrowedDeviceArray {
    if (!_borrowedDeviceArray) {
        _borrowedDeviceArray = [[NSMutableArray alloc] init];
    }
    return _borrowedDeviceArray;
}

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI Methods
    [self configureNavigationBar];
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    // 为navigationBar添加右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addDeviceCell)];
}

#pragma mark - Actions
- (void)addDeviceCell {
    TACDeviceModel *deviceModel = [[TACDeviceModel alloc] initWithDeviceName:@"" DeviceType:TACDeviceTypeiPad];
    
    [self.deviceArray addObject:deviceModel];
    
    // 重新载入数据
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *titleForHeader = nil;
    
    if (section == 0) {
        titleForHeader = @"Avaliable";
    } else {
        titleForHeader = @"Borrowed";
    }
    
    return titleForHeader;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger numberOfRows = 0;
    
    if (section == 0) {
        numberOfRows = [self.deviceArray count];
    } else {
        numberOfRows = [self.borrowedDeviceArray count];
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TACDeviceTableViewCell *cell = nil;
    NSString *reuseId = nil;
    
    // 根据Section来选择reuseId
    if (indexPath.section == 0) {
        reuseId = @"DeviceCell";
    } else {
        reuseId = @"BorrowedDeviceCell";
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    
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
    NSLog(@"%@", [self class]);
}

@end
