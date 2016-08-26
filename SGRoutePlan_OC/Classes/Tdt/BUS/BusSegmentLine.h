//
//  BusSegmentLine.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:59
 *
 *  @brief  公交线路段内容
 */

@interface BusSegmentLine : NSObject


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:22
 *
 *  @brief  此段线路的线路名
 */
@property(nonatomic,strong,nullable) NSString *lineName;//此段线路的线路名

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:56
 *
 *  @brief  此段线路的完整线路名
 */
@property(nonatomic,strong,nullable) NSString *direction;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:11
 *
 *  @brief  此段线路的坐标
 */
@property(nonatomic,strong,nullable) NSString  *linePoint;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:24
 *
 *  @brief  一条线路中每小段距离,如果此段是步行 且距离小于 20 米,不返回此线段
 */
@property(nonatomic,assign) NSInteger segmentDistance;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:37
 *
 *  @brief  此段线路需要经过的站点数
 */
@property(nonatomic,assign) NSInteger segmentStationCount;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:49
 *
 *  @brief  此段线路需要的时间
 */
@property(nonatomic,assign) NSInteger segmentTime;

@end
