//
//  ReverseAddressSearchKeyword.h
//  Pods
//
//  Created by 吴小星 on 16/9/1.
//
//

#import <Foundation/Foundation.h>

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 11:08:43
 *
 *  @brief  逆地址编码搜索请求实体
 */

@interface ReverseAddressSearchKeyword : NSObject

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 11:08:29
 *
 *  @brief  经度
 */
@property(nonatomic,assign) double lon;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 11:08:05
 *
 *  @brief  纬度
 */
@property(nonatomic,assign) double lat;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 11:08:25
 *
 *  @brief  搜索key
 */
@property(nonnull,strong,nonatomic) NSString * appkey;

/**
 *  @author crash         crash_wu@163.com   , 16-08-22 11:08:39
 *
 *  @brief  逆地址编码(1)
 */
@property(nonatomic,assign)NSInteger ver;

@end
