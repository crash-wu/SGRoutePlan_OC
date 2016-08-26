//
//  BusLineSearch.h
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enum.h"


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:02
 *
 *  @brief  公交路线请求参数实体
 */
@interface BusLineSearch : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:01
 *
 *  @brief  出发点坐标 “经度,纬度”
 */
@property(nonatomic,strong,nonnull) NSString *startposition;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:16
 *
 *  @brief  终点坐标 “经度,纬度”
 */
@property(nonatomic,strong,nonnull) NSString *endposition;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:28
 *
 *  @brief  获取线路规划类型
 */
@property(nonatomic,assign) BusLineSearchType linetype;
@end
