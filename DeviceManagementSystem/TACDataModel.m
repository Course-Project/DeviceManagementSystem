//
//  TACDataModel.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDataModel.h"
#import "TACDeviceModel.h"
#import "TACRecordModel.h"

static TACDataModel *dataModel = nil;

@implementation TACDataModel

+ (TACDataModel *)sharedDataModel {
    if (!dataModel) {
        dataModel = [[TACDataModel alloc] init];
    }
    return dataModel;
}

#pragma mark - init
- (id)init {
    self = [super init];
    if (self) { // 如果初始化成功才进行如下操作，以防出错
        
        NSString *deviceListPath = [self deviceListPath]; // 获取相应路径
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self deviceListPath]]) { // 检查保存设备信息的文件是否存在
            NSMutableData *deviceData = [[NSMutableData alloc] initWithContentsOfFile:deviceListPath]; // 读取数据
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:deviceData];
            self.deviceArray = [unarchiver decodeObject];
            [unarchiver finishDecoding];
        }
        
        NSString *recordListPath = [self recordListPath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self recordListPath]]) { // 检查保存借记信息的文件是否存在
            NSMutableData *recordData = [[NSMutableData alloc] initWithContentsOfFile:recordListPath];
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:recordData];
            self.recordArray = [unarchiver decodeObject];
            [unarchiver finishDecoding];
        }
        
//        // 从本地文件载入设备数据
//        NSString *deviceListPath = [self deviceListPath]; // 获取相应路径
//        NSMutableData *deviceData = [[NSMutableData alloc] initWithContentsOfFile:deviceListPath]; // 读取数据
//        if (deviceData.length != 0) { //如果文件存在且有数据，进行解码
//            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:deviceData];
//            self.deviceArray = [unarchiver decodeObject];
//            [unarchiver finishDecoding];
//        }
//        
//        // 从本地文件载入借记信息
//        NSString *recordListPath = [self recordListPath];
//        NSMutableData *recordData = [[NSMutableData alloc] initWithContentsOfFile:recordListPath];
//        if (recordData.length != 0) {
//            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:recordData];
//            self.recordArray = [unarchiver decodeObject];
//            [unarchiver finishDecoding];
//        }
    }
    return self;
}

#pragma mark - Properties
- (NSMutableArray *)deviceArray {
    if (!_deviceArray) {
        _deviceArray = [[NSMutableArray alloc] init];
    }
    return _deviceArray;
}

- (NSMutableArray *)recordArray {
    if (!_recordArray) {
        _recordArray = [[NSMutableArray alloc] init];
    }
    return _recordArray;
}

#pragma mark - Data Edit
 // 添加设备信息
- (void)addDevice:(TACDeviceModel *)deviceModel {
    // 添加到数组
    [self.deviceArray addObject:deviceModel];
    
    // 数组重新排序
    [self.deviceArray sortedArrayUsingFunction:sortDevice context:NULL];
    
    // 保存数据
    [self saveData];
}

// 添加借记信息
- (void)addRecord:(TACRecordModel *)recordModel {
    // 添加到数组
    [self.recordArray addObject:recordModel];
    
    // 数组重新排序
    [self.recordArray sortedArrayUsingFunction:sortRecord context:NULL];
    
    // 保存数据
    [self saveData];
}

// 删除设备信息
- (void)deleteDevice:(TACDeviceModel *)deviceModel {
    // 从数组中删除
    [self.deviceArray removeObject:deviceModel];
    
    // 保存数据
    [self saveData];
}

// 删除借记信息
- (void)deleteRecord:(TACRecordModel *)recordModel {
    // 从数组中删除
    [self.recordArray removeObject:recordModel];
    
    // 保存数据
    [self saveData];
}

// 根据索引编号删除设备信息
- (void)deleteDeviceAtIndex:(NSInteger)index {
    // 从数组中删除
    [self.deviceArray removeObjectAtIndex:index];
    
    // 保存数据
    [self saveData];
}

// 根据索引编号删除借记信息
- (void)deleteRecordAtIndex:(NSInteger)index {
    // 从数组中删除
    [self.recordArray removeObjectAtIndex:index];
    
    // 保存数据
    [self saveData];
}

// 根据索引编号获取设备信息
- (TACDeviceModel *)getDeviceAtIndex:(NSInteger)index {
    return [self.deviceArray objectAtIndex:index];
}

// 根据索引编号获取借记信息
- (TACRecordModel *)getRecordAtIndex:(NSInteger)index {
    return [self.recordArray objectAtIndex:index];
}

- (TACDeviceModel *)getDeviceWithDeviceIndex:(NSInteger)deviceIndex {
    for (TACDeviceModel *dm in self.deviceArray) {
        if (dm.deviceIndex == deviceIndex) {
            return dm;
        }
    }
    return nil;
}

#pragma mark - Return
- (void)returnDeviceWithRecord:(TACRecordModel *)recordModel {
    [recordModel returnDevice];
    
    TACDeviceModel *dm = [self getDeviceWithDeviceIndex:recordModel.deviceIndex];
    dm.isBorrowed = NO;
    
    [self.recordArray sortedArrayUsingFunction:sortRecord context:nil];
    
    [self saveData];
}

#pragma mark - Save
// 将数据保存到本地
- (void)saveData {
    [self saveDeviceData];
    [self saveRecordData];
}

// 将设备信息保存到文件
- (void)saveDeviceData {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.deviceArray];
    [archiver finishEncoding];
    [data writeToFile:[self deviceListPath] atomically:YES];
}

// 将借记信息保存到文件
- (void)saveRecordData {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.recordArray];
    [archiver finishEncoding];
    [data writeToFile:[self recordListPath] atomically:YES];
}

#pragma mark - Utils
#pragma mark Path
- (NSString *)applicationDocumentsDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)deviceListPath {
    return [[self applicationDocumentsDirectoryPath] stringByAppendingPathComponent:@"deviceList.plist"];
}

- (NSString *)recordListPath {
    return [[self applicationDocumentsDirectoryPath] stringByAppendingPathComponent:@"recordList.plist"];
}

#pragma mark Sort
NSInteger sortDevice(id l, id r, void *context) {
    
    
    
    
    return 0;
}

NSInteger sortRecord(id l, id r, void *context) {
    TACRecordModel *lRecordModel = (TACRecordModel *)l;
    TACRecordModel *rRecordModel = (TACRecordModel *)r;
    
    if ([lRecordModel isReturn]) { // lRecordModel已经归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        } else { // rRecordModel未归还
            return NSOrderedDescending; // 已归还的记录排在后面
        }
    } else { // lRecordModel未归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return NSOrderedAscending;
        } else { // rRecordModel未归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        }
    }
}





@end
