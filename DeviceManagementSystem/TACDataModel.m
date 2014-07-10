//
//  TACDataModel.m
//  DeviceManagementSystem
//
//  Created by Tom Hu on 7/11/14.
//  Copyright (c) 2014 Tom Hu. All rights reserved.
//

#import "TACDataModel.h"

static TACDataModel *dataModel = nil;

@implementation TACDataModel

+ (TACDataModel *)sharedDataModel {
    if (!dataModel) {
        dataModel = [[TACDataModel alloc] init];
    }
    return dataModel;
}

@end
