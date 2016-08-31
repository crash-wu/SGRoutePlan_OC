//
//  AGSPoint+AGSPoint_Ext.m
//  Pods
//
//  Created by 吴小星 on 16/8/26.
//
//

#import "AGSPoint+AGSPoint_Ext.h"

@implementation AGSPoint (AGSPoint_Ext)



/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:56
 *
 *  @brief 国标2000坐标系转web墨卡托坐标
 *
 *  @return 返回web墨卡托坐标
 */
-(nullable AGSPoint * ) ws84PointToWebPoint{
    
    AGSSpatialReference *spa = [[AGSSpatialReference alloc]initWithWKID:102100];
    AGSGeometryEngine *geoEng = [AGSGeometryEngine defaultGeometryEngine];
    
    AGSPoint * webPoint = [geoEng projectGeometry:self toSpatialReference:spa];
    
    return webPoint;
    
}



/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:54
 *
 *  @brief web墨卡托坐标转国标2000
 *
 *  @return 国标2000坐标
 */
-(nullable AGSPoint *)webpointToWS84point{
    AGSSpatialReference *spa = [[AGSSpatialReference alloc]initWithWKID:4490];
    AGSGeometryEngine *geoEng = [AGSGeometryEngine defaultGeometryEngine];
    
    AGSPoint * point = [geoEng projectGeometry:self toSpatialReference:spa];
    return  point;
}


@end
