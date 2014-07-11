//
//  TACDataModel.h
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TACDeviceModel, TACRecordModel;

@interface TACDataModel : NSObject

+ (TACDataModel *)sharedDataModel; // 构造数据中心

// 核心数据
@property (nonatomic, strong) NSMutableArray *deviceArray; // 存放所有的设备信息
@property (nonatomic, strong) NSMutableArray *recordArray; // 存放所有的借记信息

- (id)init; // 初始化

- (void)addDevice:(TACDeviceModel *)deviceModel; // 添加设备信息
- (void)addRecord:(TACRecordModel *)recordModel; // 添加借记信息

- (void)deleteDevice:(TACDeviceModel *)deviceModel; // 删除设备信息
- (void)deleteRecord:(TACRecordModel *)recordModel; // 删除借记信息

- (void)deleteDeviceAtIndex:(NSInteger)index; // 根据索引编号删除设备信息
- (void)deleteRecordAtIndex:(NSInteger)index; // 根据索引编号删除借记信息

- (TACDeviceModel *)getDeviceAtIndex:(NSInteger)index; // 根据索引编号获取设备信息
- (TACRecordModel *)getRecordAtIndex:(NSInteger)index; // 根据索引编号获取借记信息

- (void)saveData; // 将数据保存到本地

@end
