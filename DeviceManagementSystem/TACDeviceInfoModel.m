//
//  TACDeviceInfoModel.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceInfoModel.h"

@implementation TACDeviceInfoModel

- (id)initWithDeviceName:(NSString *)deviceName DeviceType:(TACDeviceType) deviceType {
    self = [super init];
    if (self) {
        self.deviceName = deviceName;
        self.deviceType = deviceType;
        self.isBorrowed = NO;
    }
    return self;
}

@end
