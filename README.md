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
