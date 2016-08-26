//
//  TdtPOISearchKeyWord.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Enum.h"

/**
 *  @author crash         crash_wu@163.com   , 16-03-31 11:03:31
 *
 *  @brief  天地图POI搜索关键字
 */
@interface TdtPOISearchKeyWord :NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:04
 *
 *  @brief  返回的结果数量(用于分页和缓存)
 */
@property(nonatomic,assign)NSInteger count;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:15
 *
 *  @brief  返回结果起始位(用于分页 和缓存)默认 0
 */
@property(nonatomic,assign)NSInteger start;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:30
 *
 *  @brief  搜索的关键字
 */
@property(nonatomic,strong,nullable)NSString *keyWord;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:24
 *
 *  @brief  搜索类型
 */
@property(nonatomic,assign)TdtQueryType queryType;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:56
 *
 *  @brief  查询的地图范围("-x,-y,x,y")
 */
@property(nonatomic,strong,nullable)NSString *mapBound;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:29
 *
 *  @brief  目前查询的级别
 */
@property(nonatomic,assign)NSInteger level;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:44
 *
 *  @brief  查询半径(周边搜索时)
 */
@property(nonatomic,assign)NSInteger queryRadius;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:58
 *
 *  @brief  点坐标(周边搜索)
 */
@property(nonatomic,strong,nullable)NSString *pointLonlat;

@end
