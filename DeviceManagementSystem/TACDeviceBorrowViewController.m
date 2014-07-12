//
//  TACDeviceBorrowViewController.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceBorrowViewController.h"

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
    // Do any additional setup after loading the view.
}

#pragma mark - UI Methods
- (void)configureNavigationBar {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(addRecord)];
    [self.navigationItem.rightBarButtonItem setTintColor:UIColorFromRGB(0xFFCA3F)];
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

#pragma mark - Actions
- (void)addRecord {
    
}

@end
