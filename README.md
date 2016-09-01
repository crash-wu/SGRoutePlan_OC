# SGRoutePlan_OC

[![CI Status](http://img.shields.io/travis/crash_wu/SGRoutePlan_OC.svg?style=flat)](https://travis-ci.org/crash-wu/SGRoutePlan_OC)
[![Version](https://img.shields.io/cocoapods/v/SGRoutePlan_OC.svg?style=flat)](http://cocoapods.org/pods/SGRoutePlan_OC)
[![License](https://img.shields.io/cocoapods/l/SGRoutePlan_OC.svg?style=flat)](http://cocoapods.org/pods/SGRoutePlan_OC)
[![Platform](https://img.shields.io/cocoapods/p/SGRoutePlan_OC.svg?style=flat)](http://cocoapods.org/pods/SGRoutePlan_OC)

## Author

吴小星, crash_wu@163.com

## Describe
天地图POI搜索，公交路线搜索，驾车路线搜索,逆地址编码 等服务工具。集成了在地图上展示POI搜索结果(显示大头针)，展示公交规划路线，驾车规划路线等功能

## Usage
```
#import <SGRoutePlan_OC/SGRoutePlanHeader.h>
//在项目中引入头文件
```
###SGRoutePlanService

```
/**
 *  @author crash         crash_wu@163.com   , 16-08-26 15:08:22
 *
 *  @brief  单例
 *
 */
+(nonnull instancetype) shareInstance;

/**
*  @author crash         crash_wu@163.com   , 16-08-26 11:08:49
*
*  @brief  天地图POI搜索
*
*  @param keyWordEntity 搜索类型实体
*  @param success       搜索成功返回Block
*  @param failed        失败block
*/
-(void)poiSearch:
(nullable TdtPOISearchKeyWord *)keyWordEntity success:
(nonnull void(^) (NSArray<TdtPOIResult *> *_Nullable array ))success failed:
(nonnull FailedBlock)failed;

/**
 *  @author crash         crash_wu@163.com   , 16-03-17 11:03:18
 *
 *  @brief  驾车路线规划
 
 *  @param driverEntity 驾车路线请求参数实体
 *  @param success      路线请求成功bolck
 *  @param fail         路线请求失败bolck
 */
-(void)carLineSearch :
(nullable CarLineSearch *)driverEntity success:
(nonnull void( ^)(CarLine * _Nullable array))success andFail:
(nonnull FailedBlock)fail;

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 11:08:33
 *
 *  @brief  天地图公交路线查询
 *
 *  @param entity  公交路线请求参数实体
 *  @param success 路线请求成功bolck
 *  @param failed  路线请求失败bolck
 */
-(void)busLineSearch:
(nullable BusLineSearch *)entity success:
(nonnull void(^) (NSArray<BusLine *> * _Nullable carline ))success failed:
(nonnull FailedBlock)failed;

```

### SGRoutePlanService

```
该类提供在地图上展示POI搜索结果(大头针),公交路线，驾车路线等相关功能。

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

```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
ArcGIS-Runtime-SDK-iOS for version 10.2.5
## Installation

SGRoutePlan_OC is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SGRoutePlan_OC"
```



## License

SGRoutePlan_OC is available under the MIT license. See the LICENSE file for more info.
