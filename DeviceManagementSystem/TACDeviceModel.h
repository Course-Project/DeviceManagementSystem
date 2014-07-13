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

@interface TACDeviceModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, readonly) NSInteger deviceIndex; // 设备编号
@property (nonatomic, copy) NSString *deviceName; // 设备名称
@property (nonatomic, assign) TACDeviceType deviceType; // 设备类型
@property (nonatomic, assign) BOOL isBorrowed; // 是否被借走

- (instancetype)initWithDeviceName:(NSString *)deviceName
              DeviceType:(TACDeviceType) deviceType;

@end
