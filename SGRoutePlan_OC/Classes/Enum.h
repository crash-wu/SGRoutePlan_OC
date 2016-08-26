//
//  Enum.h
//  Pods
//
//  Created by 吴小星 on 16/8/26.
//
//

#import <Foundation/Foundation.h>

@interface Enum : NSObject

@end




/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
 *
 *  @brief  天地图POI搜索类型
 */
typedef NS_ENUM(NSInteger,TdtQueryType){
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *
     *  @brief  普通搜索
     */
     GeneralType                 = 1,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *
     *  @brief  视野内搜索
     */
     KenType                     = 2,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *
     *  @brief  周边搜索
     */
     SurroundingType             = 3,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *
     *  @brief  普通建议词搜索
     */
     SuggestType                 = 4,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *
     *  @brief  公交规划起止点搜索提示词搜索
     */
     BusStationSuggestWordType   = 5,
    
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *
     *  @brief  公交规划起止点搜索
     */
     BusStationType              = 6,
    
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:53
     *  
     *  @brief  纯 POI 搜索(不搜公交线)
     */
    POI                         = 7
};



/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:50
 *
 *  @brief  驾车路线规划类型
 */
typedef NS_ENUM(NSInteger,DriveLineType){
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:50
     *
     *  @brief  最快路线
     */
    FastType=1,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:50
     *
     *  @brief  最短路线
     */
     ShortType= 2,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:50
     *
     *  @brief  避开高速
     */
    AvoidHightRoutType =3,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:50
     *  
     *  @brief  步行
     */
     WalkType =4
};





/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:07
 *
 *  @brief  公交规划搜索类型
 */
typedef NS_ENUM(NSInteger ,BusLineSearchType){
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:07
     *
     *  @brief  较快捷
     */
    SpeedyType=0,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:07
     *
     *  @brief  少换剩
     */
     LessChangeType=1,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:07
     *
     *  @brief  少步行
     */
     LessWalkType=2,
    
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:07
     *  
     *  @brief  不坐地铁
     */
     NoMetroType=3
};




/**
 *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
 *
 *  @brief   公交路线类型
 */
typedef NS_ENUM(NSInteger ,BusRouteType){
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
     *
     *  @brief  步行
     */
    WallType=1,
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
     *
     *  @brief  公交
     */
     BusType=2,
    
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
     *
     *  @brief  地铁
     */
     MetroType=3,
    
    
    /**
     *  @author crash         crash_wu@163.com   , 16-08-26 10:08:36
     *  
     *  @brief  地铁内换剩
     */
     ChangeInMetroType = 4
};
