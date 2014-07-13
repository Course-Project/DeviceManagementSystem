//
//  TACRecordModel.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACRecordModel.h"

@implementation TACRecordModel

#pragma mark - init
- (instancetype)initWithName:(NSString *)name
                 PhoneNumber:(NSString *)phoneNumber
                  DeviceName:(NSString *)deviceName
                 DeviceIndex:(NSInteger)deviceIndex {
    self = [super init];
    if (self) {
        self.name = name;
        self.phoneNumber = phoneNumber;
        self.deviceName = deviceName;
        self.deviceIndex = deviceIndex;
        
        _borrowDate = [NSDate date]; // 记录时间
        _returnDate = nil; // 因为借的时候并未归还，所以将returnDate设为nil
    }
    return self;
}

- (void)returnDevice {
    if (![self isReturn]) { // 判断设备是否归还
        // 如未归还，则将其归还
        _returnDate = [NSDate date];
    }
}

- (BOOL)isReturn {
    return _returnDate != nil;
}

- (NSString *)borrowDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [format stringFromDate:self.borrowDate];
}

- (NSString *)returnDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [format stringFromDate:self.returnDate];
}

- (NSString *)description {
    // TODO
    return [super description];
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeInteger:self.deviceIndex forKey:@"deviceIndex"];
    [aCoder encodeObject:self.borrowDate forKey:@"borrowDate"];
    [aCoder encodeObject:self.returnDate forKey:@"returnDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.deviceIndex = [aDecoder decodeIntegerForKey:@"deviceIndex"];
        _borrowDate = [aDecoder decodeObjectForKey:@"borrowDate"];
        _returnDate = [aDecoder decodeObjectForKey:@"returnDate"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    TACRecordModel *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
        copy.name = [self.name copyWithZone:zone];
        copy.phoneNumber = [self.phoneNumber copyWithZone:zone];
        copy.deviceName = [self.deviceName copyWithZone:zone];
        
        copy.deviceIndex = self.deviceIndex;
        
        copy->_borrowDate = [_borrowDate copyWithZone:zone];
        copy->_returnDate = [_returnDate copyWithZone:zone];
    }
    
    return copy;
}

@end
