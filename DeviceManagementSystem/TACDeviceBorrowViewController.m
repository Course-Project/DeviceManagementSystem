//
//  TACDeviceBorrowViewController.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceBorrowViewController.h"
#import "TACDeviceModel.h"
#import "TACRecordModel.h"

@interface TACDeviceBorrowViewController ()

@end

@implementation TACDeviceBorrowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UI Methods
    [self configureView];
    [self configureNavigationBar];
    [self configureGesture];
}

#pragma mark - UI Methods
- (void)configureView {
    self.deviceNameLabel.text = self.deviceModel.deviceName;
    if (self.deviceModel.deviceType == TACDeviceTypeiPad) {
        self.deviceTypeLabel.text = @"iPad";
    } else {
        self.deviceTypeLabel.text = @"iTouch";
    }
}

- (void)configureNavigationBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Borrow"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(addRecord)];
    [self.navigationItem.rightBarButtonItem setTintColor:UIColorFromRGB(0xFFCA3F)];
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
}

- (void)configureGesture {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.view addGestureRecognizer:singleTap];
}

#pragma mark - Actions
- (void)addRecord {
    NSString *name = self.nameTextField.text;
    NSString *phone = self.phoneTextField.text;
    
    self.deviceModel.isBorrowed = YES;
    
    TACRecordModel *recordModel = [[TACRecordModel alloc] initWithName:name PhoneNumber:phone DeviceName:self.deviceModel.deviceName DeviceIndex:self.deviceModel.deviceIndex];
    
    [[TACDataModel sharedDataModel] addRecord:recordModel];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture {
    // 移除TextField的焦点
    [self.nameTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameTextField]) {
        [self.phoneTextField becomeFirstResponder];
    } else {
        [self addRecord];
    }
    return YES;
}

@end
