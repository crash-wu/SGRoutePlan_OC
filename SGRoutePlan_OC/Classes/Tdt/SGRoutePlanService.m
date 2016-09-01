//
//  SouthgisTdtMapService.m
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SGRoutePlanService.h"
#import "SGXMLParser.h"

/**
 *  自定义 Error 标识符
 */

#define SouthgisErrorDomain @"SouthgisErrorDomain"

//天地图web 搜索服务接口(POI,地名地址，公交路线==)
#define TIANDITU_SEARCH_URL @"http://map.tianditu.com/query.shtml"

#define GET_TIANDITU_SEARCH_URL(searchType,postStr) [NSString stringWithFormat:@"%@?type=%@&postStr=%@",TIANDITU_SEARCH_URL,searchType,postStr] //天地图请求接口(POI,公交，驾车)

@implementation SGRoutePlanService

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 15:08:22
 *
 *  @brief  单例
 *
 */
+(nonnull instancetype) shareInstance{
    
    static SGRoutePlanService *instance ;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        instance = [[super alloc] init];
    });
    
    return instance;
}

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
(nonnull FailedBlock)failed{
    
    NSString *postStr = [[keyWordEntity yy_modelToJSONString] stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLHostAllowedCharacterSet]];
    
    NSString *urlStr = GET_TIANDITU_SEARCH_URL(@"query",postStr);
    
   [ [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            if (failed) {
                failed(error);
            }
            return ;
        }
        
        if (!data || data.length == 0) {
            if (failed) {
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                failed(error);
            }
            return ;
        }
        
        id json;
        if ([data isKindOfClass:[NSData class]]) {
            json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        }
        
    
        if (success && json) {

            NSArray *dataArray=[NSArray yy_modelArrayWithClass:[TdtPOIResult class] json:[json objectForKey:@"pois"]];
            
            if (dataArray != nil){
                
                success(dataArray);
            }else{
                failed(nil);
            }
            return ;
            
        } else if (failed) {
            NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:-8001 userInfo:@{@"message": @"公交查询结果解析失败"}];
            failed(error);
            return;
        }
    } ] resume];
    
}






/**
 *  @author crash         crash_wu@163.com   , 16-08-26 11:08:56
 *
 *  @brief  驾车路线规划
 *
 *  @param driverEntity 驾车路线请求参数实体
 *  @param success      路线请求成功bolck
 *  @param fail         路线请求失败bolck
 */
-(void)carLineSearch :
(nullable CarLineSearch *)driverEntity success:
(nonnull void(^)(CarLine  * _Nullable carline))success andFail:
(nonnull FailedBlock)fail{
    
    NSString *postStr = [[driverEntity yy_modelToJSONString]stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];

    
    NSString *urlStr = GET_TIANDITU_SEARCH_URL(@"search",postStr);

    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        

        if (error) {
            if (fail) {
                fail(error);
            }
            return ;
        }
        
        if (!data || data.length == 0) {
            if (fail) {
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                fail(error);
            }
            return ;
        }
        

//        
        //解析XML
        SGXMLParser *parser = [[SGXMLParser alloc]init];
        NSDictionary *resultObject = [parser parseData:data];
        NSDictionary *resultStr = [resultObject objectForKey:@"result"];
        if (resultObject == nil || [resultStr allKeys].count == 0) {
            // [AppUtils showErrorMessage:TEXT_SERVER_NOT_RESPOND];
            if (fail) {
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"无效的响应数据",
                                           @"message": @"无效的响应数据"};
                
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain
                                                     code:BaiduWebServerErrorInvalidResponseData
                                                 userInfo:userInfo];
                fail(error);
            }
            
            return;
        }
        
        CarLine *carLine = [[CarLine alloc]init];
        
        carLine.mapInfo = [SGXMLParser getDataAtPath:@"result.mapinfo" fromResultObject:resultObject];
        
        carLine.distance = [SGXMLParser getDataAtPath:@"result.distance" fromResultObject:resultObject];
        
        NSArray	*dataArray = [SGXMLParser getDataAtPath:@"result.routes.item" fromResultObject:resultObject];
        
        carLine.carRoutes=[NSArray yy_modelArrayWithClass:[CarLineNode class] json:dataArray];
        
        carLine.routelatlon = [SGXMLParser getDataAtPath:@"result.routelatlon" fromResultObject:resultObject];
        
        success(carLine);
        
        
    }] resume];
    
}




/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:18
 *
 *  @brief  天地图公交路线查询
 *  @param entity  公交路线请求参数实体
 *  @param success 路线请求成功bolck
 *  @param failed  路线请求失败bolck
 */
-(void)busLineSearch:
(nullable BusLineSearch * ) entity success:
(nonnull void(^) ( NSArray<BusLine *> * _Nullable array ))success failed:
(nonnull FailedBlock)failed{
    
    NSString *postStr = [[entity yy_modelToJSONString]stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];

    
    NSString *urlStr = GET_TIANDITU_SEARCH_URL(@"busline",postStr);

    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        

        if (error) {
            if (failed) {
                failed(error);
            }
            return ;
        }
        
        if (!data || data.length == 0) {
            if (failed) {
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                failed(error);
            }
            return ;
        }
        
        id json;
        if ([data isKindOfClass:[NSData class]]) {
            json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        }
        
        NSArray *array = [json objectForKey:@"results"];
        if (array.count == 0) {
            if (failed) {

                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                
                failed(error);
            }
            
            return ;
        }
        
        NSArray *lines =[ array[0] objectForKey:@"lines"];
            
        NSArray *lineArray=[NSArray yy_modelArrayWithClass:[BusLine class] json:lines];
        if (lineArray != nil) {
            if (success) success(lineArray);
            
        }else{
            if (failed) failed(nil);
        }

    }] resume];
}




@end
