//
//  CarMapInfoNode.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 11:03:49
 *
 *  @brief  驾车路线图层属性实体（路线显示完整中心经纬度，缩放比例）
 */

@interface CarMapInfoNode : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:14
 *
 *  @brief  全部结果同时显示的适宜中心经纬度
 */
@property(nonatomic,strong,nullable) NSString *center;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:50
 *
 *  @brief  全部结果同时显示的适宜缩放比例
 */
@property(nonatomic,strong,nullable) NSString *scale;
@end
