//
//  SGRoutePlanUtil.h
//  Pods
//
//  Created by 吴小星 on 16/8/26.
//
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>
#import "AGSPoint+AGSPoint_Ext.h"
#import "TdtPOIResult.h"
#import "BusLine.h"
#import "CarLine.h"

@interface SGRoutePlanUtil : NSObject


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:34
 *
 *  @brief  单例
 *
 */
+(nonnull instancetype) sharedInstance;

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:34
 *
 *  @brief  清除天地图poi搜索结果展示图层
 *
 *  @param mapView 当前地图
 */
-(void)clearPOIResultLayer:(nonnull AGSMapView *)mapView;

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:32
 *
 *  @brief  移除驾车路线图层或者公交路线图层
 *
 *  @param mapView 地图
 */
-(void)clearLineLayer:(nonnull AGSMapView *)mapView;

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:57
 *
 *  @brief  清除天地图POI搜索结果高亮显示图层(或者 清除单个坐标点添加显示大头针图层)
 *
 *  @param mapView 当前地图
 */
-(void)clearHighlightLayer:(nonnull AGSMapView *)mapView;


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:32
 *
 *  @brief  获取当前地图左上角，右下角坐标(xmin,ymin,xmax,ymax)
 *
 *  @param mapView 地图
 *
 *  @return 返回地图的左上角坐标，与右下角坐标(xmin,ymin,xmax,ymax)
 */
-(NSString *_Nullable) getMapBound:(nonnull AGSMapView * )mapView;

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 14:08:03
 *
 *  @brief  在地图页面上，以大头针形式展示天地图POI搜索数据
 *
 *  @param pois      天地图POI搜索结果数组
 *  @param mapview   地图
 *  @param imageName 大头针图标名称
 */
-(void) showPOIResultsLayer:
(nullable NSArray<TdtPOIResult *> *) pois andMapView:
(nonnull AGSMapView *) mapview andImageName:
(nullable NSString  *)imageName;

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 15:08:13
 *
 *  @brief  高亮显示天地图POI搜索结果
 *
 *  @param poi       天地图POI搜索数据
 *  @param mapView   地图
 *  @param imageName 图标名称
 */
-(void)showHighlightLayer:
(nonnull TdtPOIResult *)poi andMapView:
(nonnull AGSMapView *)mapView andImageName :
(nonnull NSString *) imageName;


/**
 绘制公交路线图
 
 :param: busLine        公公交线路实体
 
 :param: mapView        地图
 
 :param: lineColor      线路颜色
 
 :param: startImageName 起点图标名称
 
 :param: endImageName   终点图标名称
 */

-(void)drawBusLine:
(nonnull BusLine *)buseLine andMapView:
(nonnull AGSMapView *)mapView andColor:
(nonnull UIColor *)lineColor andStartImage:
(nonnull NSString *)startImageName andEndImage:
(nonnull NSString *)endImageName;


/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:44
 *
 *  @brief  绘制驾车路线
 *
 *  @param carline        驾车路线实体
 *  @param mapView        地图
 *  @param lineColor      路线颜色
 *  @param startImageName 起点图标名称
 *  @param endImageName   终点图标名称
 */
-(void)drawDriveLine:
(nonnull CarLine *)carline andMapView:
(nonnull AGSMapView *)mapView andColor:
(nonnull UIColor *)lineColor andStartImage:
(nonnull NSString *)startImageName andEndImage:
(nonnull NSString *)endImageName;

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:45
 *
 *  @brief 将地图缩放到第10级
 *
 *  @param mapView 地图
 */
-(void)zoomTo10Level:(nonnull AGSMapView *)mapView;

@end
