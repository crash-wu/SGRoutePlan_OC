//
//  BusLine.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusSegment.h"

/**
 *  @author crash         crash_wu@163.com   , 16-03-17 14:03:08
 *
 *  @brief  公交线路
 */
@interface BusLine : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:39
 *
 *  @brief  单条公交结果线路名称,如:3 路—4 路—5 路
 */
@property (nonatomic,strong,nullable) NSString *lineName;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:54
 *
 *  @brief  单条公交结果中的各段线路信息
 */
@property(nonatomic,strong,nullable) NSArray<BusSegment *> *segments;
@end
