//
//  TACRecordModel.h
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TACRecordModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *name; // 用户名称
@property (nonatomic, copy) NSString *phoneNumber; // 用户手机号
@property (nonatomic, copy) NSString *deviceName; // 所借的设备名称
@property (nonatomic, assign) NSUInteger deviceIndex; // 设备编号
@property (nonatomic, readonly) NSDate *borrowDate; // 借设备的时间
@property (nonatomic, readonly) NSDate *returnDate; // 还设备的时间

- (instancetype)initWithName:(NSString *)name
       PhoneNumber:(NSString *)phoneNumber
                  DeviceName:(NSString *)deviceName
                 DeviceIndex:(NSInteger)deviceIndex;

- (NSString *)description; // 重写当前类的description方法
- (void)returnDevice; // 归还设备
- (BOOL)isReturn; // 查看当前记录所对应的设备是否归还
- (NSString *)borrowDateString;
- (NSString *)returnDateString;

@end
