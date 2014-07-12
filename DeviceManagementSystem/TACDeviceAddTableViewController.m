//
//  TACDeviceAddTableViewController.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/12/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceAddTableViewController.h"
#import "TACDeviceModel.h"
#import "TACDataModel.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TACDeviceAddTableViewController ()

@end

@implementation TACDeviceAddTableViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI Methods
    [self configureNavigationBar];
    [self configureGesture];
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    self.navigationItem.title = @"Add Device";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(addDevice)];
    [self.navigationItem.rightBarButtonItem setTintColor:UIColorFromRGB(0xFFCA3F)];
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
}

- (void)configureGesture {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.view addGestureRecognizer:singleTap];
}

#pragma mark - Actions
- (void)addDevice {
    NSString *deviceName = self.deviceNameTextField.text;
    TACDeviceType deviceType = [self.deviceTypeTextField.text isEqualToString:@"iPad"] ? TACDeviceTypeiPad : TACDeviceTypeiTouch;
    TACDeviceModel *deviceModel = [[TACDeviceModel alloc] initWithDeviceName:deviceName DeviceType:deviceType];
    
    [[TACDataModel sharedDataModel] addDevice:deviceModel];
    
    // 返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture {
    // 移除TextField的焦点
    [self.deviceNameTextField resignFirstResponder];
    [self.deviceTypeTextField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"textfield: %@", textField.text);
    NSLog(@"string: %@", string);
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.deviceNameTextField]) {
        [self.deviceTypeTextField becomeFirstResponder];
    } else {
        [self addDevice];
    }
    return YES;
}

@end
