//
//  ReverseAddress.h
//  Pods
//
//  Created by 吴小星 on 16/9/1.
//
//

#import <Foundation/Foundation.h>

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 11:08:49
 *
 *  @brief  经纬度坐标实体
 */
@interface Location : NSObject

/// 经度
@property(nonatomic,assign) double lon;

/// 纬度
@property(nonatomic,assign)double lat;

@end

/**
 *  @author crash         crash_wu@163.com   , 16-09-01 11:09:33
 *
 *  @brief  完整的地址位置信息实体
 */
@interface AddressComponent : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-09-01 11:09:25
 *
 *  @brief 名称
 */
@property(nonatomic,strong,nullable) NSString *poi;



/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:33
 *
 *  @brief  街道编号
 */
@property(nonatomic,strong,nullable)   NSNumber  *road_distance;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:51
 *
 *  @brief  名称编号
 */
@property(nonatomic,strong,nullable) NSNumber *poi_distance;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:06
 *
 *  @brief  地址编号
 */
@property(nonatomic,strong,nullable)NSNumber * address_distance;


/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:28
 *
 *  @brief  地址方位
 */
@property(nonatomic,strong,nullable)NSString * address_position;


/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:05
 *
 *  @brief  所属行政区(镇)
 */
@property(nonatomic,strong,nullable)NSString * address;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:51
 *
 *  @brief  道路名称
 */
@property(nonatomic,strong,nullable)NSString *road;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:10
 *
 *  @brief  方位
 */
@property(nonatomic,strong,nullable)NSString* poi_position;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 14:08:28
 *
 *  @brief  所属行政区(市，乡，县)
 */
@property(nonatomic,strong,nullable)NSString *city;


@end


/**
 *  @author crash         crash_wu@163.com   , 16-09-01 11:09:54
 *
 *  @brief   逆地址搜索结果实体(依据经纬度坐标查找位置信息)
 */
@interface ReverseAddress : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-09-01 11:09:24
 *
 *  @brief 位置经纬度坐标实体
 */
@property(nonatomic,strong,nullable) Location *location;

/**
 *  @author crash         crash_wu@163.com   , 16-09-01 11:09:07
 *
 *  @brief 详情的位置信息
 */
@property(nonatomic,strong,nullable) AddressComponent *addressComponent;

/**
 *  @author crash         crash_wu@163.com   , 16-09-01 11:09:56
 *
 *  @brief  位置信息
 */
@property(nullable,nonatomic,strong) NSString *formatted_address;



@end

