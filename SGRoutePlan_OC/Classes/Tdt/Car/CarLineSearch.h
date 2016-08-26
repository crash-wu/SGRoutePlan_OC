//
//  CarLineSearch.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enum.h"


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 10:03:46
 *
 *  @brief  驾车规划请求参数实体
 */
@interface CarLineSearch : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
 *
 *  @brief  起点经纬度
 */
@property(nonatomic,strong,nonnull) NSString *orig;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:46
 *
 *  @brief  终点经纬度
 */
@property(nonatomic,strong,nonnull) NSString *dest;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:55
 *
 *  @brief  途径点经纬度和 类型集合
 */
@property(nonatomic,strong,nullable) NSString *mid;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:08
 *
 *  @brief  驾车路线规划类型
 */
@property(nonatomic,assign) DriveLineType style;


@end
