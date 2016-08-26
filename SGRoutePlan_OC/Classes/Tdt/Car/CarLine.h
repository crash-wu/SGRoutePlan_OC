//
//  CarLineEntity.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarLineNode.h"
#import "CarMapInfoNode.h"


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 10:03:22
 *
 *  @brief  驾车路线实体
 */

@interface CarLine : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:22
 *
 *  @brief  驾车节点
 */
@property(nonatomic,strong,nullable)NSArray<CarLineNode*> *carRoutes;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
 *
 *  @brief  驾车查询时，导航路线地图的信息
 */
@property(nonatomic,strong,nullable)CarMapInfoNode *mapInfo;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
 *
 *  @brief  距离
 */
@property(nonatomic,strong,nullable)NSString *distance;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:06
 *
 *  @brief  线路经纬度字符串
 */
@property(nonatomic,strong,nullable)NSString *routelatlon;//线路经纬度字符串

@end
