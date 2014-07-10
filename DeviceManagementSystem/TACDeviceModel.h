//
//  TACDeviceInfoModel.h
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TACDeviceType) {
    TACDeviceTypeiPad, // iPad
    TACDeviceTypeiTouch // iTouch
};

@interface TACDeviceModel : NSObject

@property (nonatomic, strong) NSString *deviceName; // 设备名称
@property (nonatomic) TACDeviceType deviceType; // 设备类型
@property (nonatomic) BOOL isBorrowed; // 是否被借走

- (id)initWithDeviceName:(NSString *)deviceName DeviceType:(TACDeviceType) deviceType;

@end
