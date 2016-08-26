//
//  BusStation.h
//  imapMobile
//
//  Created by 吴小星 on 16/5/31.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:24
 *
 *  @brief  公交站点信息实体
 */
@interface BusStation : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:40
 *
 *  @brief  经纬度
 */
@property(nonatomic,strong,nullable) NSString *lonlat;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:51
 *
 *  @brief  名称
 */
@property(nonatomic,strong,nullable) NSString *name;

@end
