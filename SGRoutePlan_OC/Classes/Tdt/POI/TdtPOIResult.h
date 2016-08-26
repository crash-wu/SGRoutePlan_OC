//
//  TiandituPOIEntity.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 12:03:20
 *
 *  @brief  天地图POI搜索结果实体类
 */

@interface TdtPOIResult : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:57
 *
 *  @brief POI点名称
 */
@property(nonatomic,strong,readwrite,nullable) NSString *name;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:14
 *
 *  @brief  电话号码
 */
@property(nonatomic,strong,readwrite,nullable) NSString *phone;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:30
 *
 *  @brief  地址
 */
@property(nonatomic,strong,readwrite,nullable) NSString *address;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:47
 *
 *  @brief  POI点坐标
 */
@property(nonatomic,strong,readwrite,nullable) NSString *lonlat;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:03
 *
 *  @brief  距离
 */
@property(nonatomic,assign,readwrite) NSInteger distance;

@end
