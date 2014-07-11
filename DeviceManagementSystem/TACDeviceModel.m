//
//  TACDeviceInfoModel.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDeviceModel.h"

@implementation TACDeviceModel

#pragma mark - init
- (instancetype)initWithDeviceName:(NSString *)deviceName
              DeviceType:(TACDeviceType) deviceType {
    self = [super init];
    if (self) {
        self.deviceName = deviceName;
        self.deviceType = deviceType;
        self.isBorrowed = NO;
    }
    return self;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeInteger:self.deviceType forKey:@"deviceType"];
    [aCoder encodeBool:self.isBorrowed forKey:@"isBorrowed"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.deviceType = [aDecoder decodeIntegerForKey:@"deviceType"];
        self.isBorrowed = [aDecoder decodeBoolForKey:@"isBorrowed"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    TACDeviceModel *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
        copy.deviceName = [self.deviceName copyWithZone:zone];
        copy.deviceType = self.deviceType;
        copy.isBorrowed = self.isBorrowed;
    }
    
    return copy;
}

@end
