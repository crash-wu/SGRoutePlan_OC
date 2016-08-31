//
//  AGSPoint+AGSPoint_Ext.h
//  Pods
//
//  Created by 吴小星 on 16/8/26.
//
//

#import <ArcGIS/ArcGIS.h>

@interface AGSPoint (AGSPoint_Ext)

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:56
 *
 *  @brief 国标2000坐标系转web墨卡托坐标
 *
 *  @return 返回web墨卡托坐标
 */
-(nullable AGSPoint * ) ws84PointToWebPoint;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:54
 *
 *  @brief web墨卡托坐标转国标2000
 *
 *  @return 国标2000坐标
 */
-(nullable AGSPoint *)webpointToWS84point;

@end
