//
//  CarLineNode.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 11:03:25
 *
 *  @brief  驾车路线分段节点实体
 */
@interface CarLineNode : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:52
 *
 *  @brief  每段线路文字描述
 */
@property(nonatomic,strong,nullable) NSString *strguide;//每段线路文字描述


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:02
 *
 *  @brief  “路牌”引导提示/高速路收费站出口信息
 */
@property(nonatomic,strong,nullable) NSString *signage;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:16
 *
 *  @brief  当前路段名称
 */
@property(nonatomic,strong,nullable) NSString *streetName;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:27
 *
 *  @brief  下一段道路名称
 */
@property(nonatomic,strong,nullable) NSString *nextStreetName;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:40
 *
 *  @brief  道路收费信息(0=免费路段,1=收费路段,2=部分收费路 段)
 */
@property(nonatomic,strong,nullable) NSString *tollStatus;

@end
