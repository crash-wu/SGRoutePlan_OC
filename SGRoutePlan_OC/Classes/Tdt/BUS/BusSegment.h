//
//  BusSegment.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusSegmentLine.h"
#import "BusStation.h"
#import "Enum.h"



/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:32
 *
 *  @brief  单条公交结果中的各段线路信息
 */
@interface BusSegment : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:13
 *
 *  @brief  线路类型
 */
@property (nonatomic,assign) BusRouteType segmentType;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:28
 *
 *  @brief  起站点内容
 */
@property(nonatomic,strong,nullable) BusStation *stationStart;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:37
 *
 *  @brief  终站点内容
 */
@property(nonatomic,strong,nullable) BusStation *stationEnd;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:52
 *
 *  @brief  线路内容
 */
@property(nonatomic,strong,nullable) NSArray< BusSegmentLine*> *segmentLine;

@end
