//
//  TACDeviceAddTableViewController.h
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TACDeviceAddTableViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *deviceNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *deviceTypeTextField;

@end
