//
//  TACRecordDetailTableViewController.h
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TACRecordModel;

@interface TACRecordDetailTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *borrowDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnDateLabel;
@property (nonatomic, strong) TACRecordModel *recordModel;

@end
