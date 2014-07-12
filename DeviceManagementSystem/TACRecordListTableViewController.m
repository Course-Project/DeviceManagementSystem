//
//  TACRecordListTableViewController.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/6/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACRecordListTableViewController.h"
#import "TACRecordDetailTableViewController.h"
#import "TACRecordTableViewCell.h"
#import "TACRecordModel.h"

@interface TACRecordListTableViewController ()

@end

@implementation TACRecordListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[TACDataModel sharedDataModel] recordArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TACRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell" forIndexPath:indexPath];
    
    cell.recordModel = [[TACDataModel sharedDataModel] getRecordAtIndex:indexPath.row];
    
    cell.deviceNameLabel.text = cell.recordModel.deviceName;
    cell.nameLabel.text = cell.recordModel.name;
    cell.phoneLabel.text = cell.recordModel.phoneNumber;
    
    if ([cell.recordModel isReturn]) {
        cell.dateLabel.text = [cell.recordModel returnDateString];
        cell.statusLable.text = @"Returned";
    } else {
        cell.dateLabel.text = [cell.recordModel borrowDateString];
        cell.statusLable.text = @"";
    }
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TACRecordDetailTableViewController *vc = segue.destinationViewController;
    vc.recordModel = ((TACRecordTableViewCell *)sender).recordModel;
}

@end
