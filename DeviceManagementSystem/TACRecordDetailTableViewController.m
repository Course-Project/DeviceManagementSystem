//
//  TACRecordDetailTableViewController.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACRecordDetailTableViewController.h"
#import "TACRecordModel.h"

@interface TACRecordDetailTableViewController ()

@end

@implementation TACRecordDetailTableViewController

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
    
    // UI Methods
    [self configureView];
}

#pragma mark - UI Methods
- (void)configureView {
    self.deviceNameLabel.text = self.recordModel.deviceName;
    self.nameLabel.text = self.recordModel.name;
    self.phoneLabel.text = self.recordModel.phoneNumber;
    self.borrowDateLabel.text = [self.recordModel borrowDateString];
    self.returnDateLabel.text = [self.recordModel returnDateString];
}

@end
