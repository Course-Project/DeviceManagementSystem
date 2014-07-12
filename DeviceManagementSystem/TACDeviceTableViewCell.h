//
//  TACDeviceTableViewCell.h
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/6/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TACDeviceModel.h"

@interface TACDeviceTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *deviceNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *deviceStatusLabel;

@property (nonatomic, strong) TACDeviceModel *deviceModel;

@end
