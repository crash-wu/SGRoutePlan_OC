//
//  SGRoutePlanUtil.m
//  Pods
//
//  Created by 吴小星 on 16/8/26.
//
//

#import "SGRoutePlanUtil.h"

/***  POI大头针选择图层  ***/
#define  POI_POPO_SELECT_LAYER_NAME  @"poi_popo_select_layer_name"

/***  天地图POI搜索结果展示图层  ***/
#define POI_POPO_LAYER_NAME @"poi_popo_layer_name"

/******** POI 坐标 *********/
#define POI_LONLAT  @"poi_lonlat"

/******** CallOut 类型 *********/
#define  CALLOUT_TYPE  @"type"

/*** 兴趣点点击弹出Callout名称 ****/
#define  POI_CALLOUT_LAYER_NAME  @"poi_callout_layer_name"



/******** POI 名称 *********/
#define  POI_NAME  @"poi_name"

/******** POI 地址 *********/
#define POI_ADDRESS  @"poi_address"

/******** POI 联系电话 *********/
#define POI_PHONE @"poi_phone"

/******** POI 坐标 *********/
#define POI_LONLAT @"poi_lonlat"

/***  驾车路线图层  ****/
#define CAR_LINE_LAYER_NAME  @"car_line_layer_name"

/******** 驾车路线起点图层 *********/
#define CAR_LINE_ORIGIN_LAYER_NAME  @"car_Line_origin_layer_name"

/******** 驾车路线终点图层 *********/
#define CAR_LINE_DESTION_LAYER_NAME  @"car_line_destion_layer_name"


@implementation SGRoutePlanUtil

/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:34
 *
 *  @brief  单例
 *
 */
+(instancetype) sharedInstance{
    
    static SGRoutePlanUtil * instance = nil;
    
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        
        instance = [[super alloc]init];
    });
    
    return instance;
}




/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:34
 *
 *  @brief  清除天地图poi搜索结果展示图层
 *
 *  @param mapView 当前地图
 */
-(void)clearPOIResultLayer:(nonnull AGSMapView *)mapView{
    [mapView removeMapLayerWithName:POI_POPO_LAYER_NAME];
}


/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:32
 *
 *  @brief  移除驾车路线图层或者公交路线图层
 *
 *  @param mapView 地图
 */
-(void)clearLineLayer:(nonnull AGSMapView *)mapView{
    [mapView removeMapLayerWithName:CAR_LINE_LAYER_NAME];
    [mapView removeMapLayerWithName:CAR_LINE_DESTION_LAYER_NAME];
    [mapView removeMapLayerWithName:CAR_LINE_ORIGIN_LAYER_NAME];
}

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:57
 *
 *  @brief  清除天地图POI搜索结果高亮显示图层(或者 清除单个坐标点添加显示大头针图层)
 *
 *  @param mapView 当前地图
 */
-(void)clearHighlightLayer:(nonnull AGSMapView *)mapView{
    [mapView removeMapLayerWithName:POI_POPO_SELECT_LAYER_NAME];
}


/**
 *  @author crash         crash_wu@163.com   , 16-08-26 14:08:32
 *
 *  @brief  获取当前地图左上角，右下角坐标(xmin,ymin,xmax,ymax)
 *
 *  @param mapView 地图
 *
 *  @return 返回地图的左上角坐标，与右下角坐标(xmin,ymin,xmax,ymax)
 */
-(NSString *_Nullable) getMapBound:(nonnull AGSMapView * )mapView{
    
    NSString * mapBound = [NSString new];
    
    //获取地图四个角的范围
    AGSEnvelope *envelope= mapView.visibleAreaEnvelope;
    
    if (mapView.spatialReference.isAnyWebMercator){
        
        AGSPoint *minPoint = [[AGSPoint alloc] initWithX:envelope.xmin y:envelope.ymin spatialReference:mapView.spatialReference];
        
        AGSPoint *maxPoint = [[AGSPoint alloc] initWithX:envelope.xmax y:envelope.ymax spatialReference:mapView.spatialReference];
        
        minPoint = [ minPoint webpointToWS84point];
        maxPoint = [maxPoint webpointToWS84point];
        
        mapBound = [NSString stringWithFormat:@"%lf,%lf,%lf,%lf",minPoint.x,minPoint.y,maxPoint.x,maxPoint.y];
        
    }else{
        mapBound = [NSString stringWithFormat:@"%lf,%lf,%lf,%lf",envelope.xmin,envelope.ymin,envelope.xmax,envelope.ymax];
    }
    
    
    return  mapBound;
    
}


/**
 *  @author crash         crash_wu@163.com   , 16-08-31 11:08:51
 *
 *  @brief   将POI搜索经纬度坐标转化成web坐标系
 *
 *  @param pois 天地图POI搜索结果数组
 *
 *  @return 坐标系转化后的
 */
-(nullable NSArray<TdtPOIResult *> * )transferPoiResultToWebSpatialReference:
(nullable NSArray <TdtPOIResult *> *) pois {
    
    NSArray<TdtPOIResult *> *result = [[NSArray alloc]init];
    
    for (TdtPOIResult * value in pois){
        
        if (value.lonlat != nil){
            
            NSArray<NSString *> * lonlat = [value.lonlat componentsSeparatedByString:@" "];
            if(lonlat != nil && lonlat.count > 0){
                
                AGSPoint *point = [[AGSPoint alloc]initWithX:[lonlat[0] doubleValue] y:[lonlat[1] doubleValue] spatialReference:[AGSSpatialReference wgs84SpatialReference]];
                
                point = [point webpointToWS84point];
                
                value.lonlat = [NSString stringWithFormat:@"%lf %lf",point.x,point.y];
                [result arrayByAddingObject:value];
            }
        }
        
    }
    
    return result;
    
}



/**
 *  @author crash         crash_wu@163.com   , 16-08-31 14:08:07
 *
 *  @brief 给坐标点添加显示大头针
 *
 *  @param point     坐标点
 
 *  @param imageName 大头针图层名称
 
 *  @param mapview   地图
 */
-(void) showPinLayerToLocation:
(nonnull AGSPoint * ) point andSybolImage :
(nonnull NSString *)imageName andMapView :
(nonnull AGSMapView *)mapview{

    
    AGSGraphicsLayer *symbolLayer = [[AGSGraphicsLayer alloc]init];
    AGSPictureMarkerSymbol *graphicSymbol = [[AGSPictureMarkerSymbol alloc]initWithImageNamed:imageName];
    NSDictionary *attributes = @{@"type":@"pingLayer"};
    AGSGraphic *graphic = [[AGSGraphic alloc]initWithGeometry:point symbol:graphicSymbol attributes:attributes];
    [symbolLayer addGraphic:graphic];
    [symbolLayer refresh];
    [mapview addMapLayer:symbolLayer withName:POI_POPO_SELECT_LAYER_NAME];
}




/**
 *  @author crash         crash_wu@163.com   , 16-08-31 14:08:05
 *
 *  @brief 获取天地图POI搜索结果经纬度坐标数组
 *
 *  @param pois    poi搜索结果实体数组
 *  @param mapView 当前地图
 *
 *  @return 经纬度坐标数组
 */

-(nullable NSArray<AGSPoint *> *)getPOIPoints:
(nonnull NSArray<TdtPOIResult *> *)pois andMapView :
(nonnull AGSMapView * ) mapView{
    
    NSArray<AGSPoint *> *array = [[NSArray alloc]init];
    
    for(TdtPOIResult *poi in pois){
        
        if (poi.lonlat != nil){
            
            NSArray<NSString *> * lonlat = [poi.lonlat componentsSeparatedByString:@" "];
            
            if(lonlat != nil && lonlat.count > 0){
                
                AGSPoint *point = [[AGSPoint alloc]initWithX:[lonlat[0] doubleValue] y:[lonlat[1] doubleValue] spatialReference:mapView.spatialReference];
                [array arrayByAddingObject:point];
            }
        }
    }
}




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
(nullable NSString  *)imageName{
    
    //先清除图层
    [mapview removeMapLayerWithName:POI_POPO_LAYER_NAME];
    
    AGSGraphicsLayer *symbolLayer = [[AGSGraphicsLayer alloc]init];
    
    for(TdtPOIResult *poi in pois){
        

        symbolLayer = [self addPinToMapView:symbolLayer andPoi:poi andMapView:mapview andImageName:imageName];
    }
    
    [mapview addMapLayer:symbolLayer withName:POI_POPO_LAYER_NAME];
}



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
(nonnull NSString *) imageName{
    
    //先清除图层
    [mapView removeMapLayerWithName:POI_POPO_SELECT_LAYER_NAME];
    
    AGSGroupLayer *symbolLayer = [self addPinToMapView:[[AGSGraphicsLayer alloc] init] andPoi:poi andMapView:mapView andImageName:imageName];
    
    [mapView addMapLayer:symbolLayer withName:POI_POPO_SELECT_LAYER_NAME];
    
}

/**
 *  @author crash         crash_wu@163.com   , 16-08-31 15:08:18
 *
 *  @brief  添加大头针到地图
 *
 *  @param symbolLayer 图层
 *  @param poi         天地图POI搜索结果实体
 *  @param mapView     地图
 *  @param imageName   大头针图标名称
 *
 *  @return 图层
 */
-(nonnull AGSGraphicsLayer *)addPinToMapView:
(nonnull AGSGraphicsLayer *) symbolLayer andPoi:
(nonnull TdtPOIResult *)poi andMapView:
(nonnull AGSMapView *)mapView andImageName:
(nonnull NSString *)imageName{

    
    AGSPictureMarkerSymbol *graphicSymbol = [[AGSPictureMarkerSymbol alloc]initWithImageNamed:imageName];

    
    if (poi.lonlat != nil){
        
      NSArray<NSString *> * lonlats = [poi.lonlat componentsSeparatedByString:@" "];
        
        if (lonlats != nil && lonlats.count> 0){
            
            AGSPoint *point = [[AGSPoint alloc]initWithX:[lonlats[0] doubleValue] y:[lonlats[1] doubleValue] spatialReference:mapView.spatialReference];
            
            //大头针属性
            NSMutableDictionary * attributes = [[NSMutableDictionary alloc]init];
            
            //判断地图的坐标系
            if(mapView.spatialReference.isAnyWebMercator){
                //墨卡托坐标系
                point = [point webpointToWS84point];
            }
            
            NSString *ws84LonLat = [NSString stringWithFormat:@"%lf,%lf",point.x,point.y];

            //经纬度字符串
            attributes[POI_LONLAT] = ws84LonLat;

            attributes[ CALLOUT_TYPE] = POI_CALLOUT_LAYER_NAME;
            
            //地址属性
            if (poi.address != nil){
                
                attributes[POI_ADDRESS] = poi.address;
            }
            
            //名称属性
            if (poi.name != nil){
                
                attributes[POI_NAME] = poi.name;
            }
            
            if(poi.phone != nil){
                attributes[POI_PHONE] = poi.phone;
            }

        
            AGSGraphic *graphic = [[AGSGraphic alloc]initWithGeometry:point symbol:graphicSymbol attributes:attributes];
            
            [symbolLayer addGraphic:graphic];
            [mapView zoomToGeometry:point withPadding:0 animated:true];
            
        }
    }
    
    return symbolLayer;
}


/**
 *  @author crash         crash_wu@163.com   , 16-08-31 15:08:20
 *
 *  @brief  根据经纬度坐标点数字，在地图上绘制驾车/公交路线图
 *
 *  @param points         经纬度坐标点数组
 *  @param color          线条颜色
 *  @param mapView        地图
 *  @param startImageName 驾车/公交起点图标名称
 *  @param endImageName   驾车/公交终点图标名称
 */
-(void)drawLineOnMapView:
(nullable NSArray<AGSPoint *> *)points andColor:
(nullable UIColor *)color andMapView:
(nullable AGSMapView *)mapView andStartImageName:
(nullable NSString *)startImageName andEndImageName:
(nullable NSString *)endImageName{
    
    //绘制图层前，线移除相关的图层
    [mapView removeMapLayerWithName:CAR_LINE_LAYER_NAME];
    [mapView removeMapLayerWithName:CAR_LINE_ORIGIN_LAYER_NAME];
    [mapView removeMapLayerWithName:CAR_LINE_DESTION_LAYER_NAME];
    
    AGSGraphicsLayer *symbolLayer = [[AGSGraphicsLayer alloc]init];
    
    AGSMutablePolyline *poly = [[AGSMutablePolyline alloc]initWithSpatialReference:mapView.spatialReference];
    
    [poly addPathToPolyline];
    
    for (AGSPoint *point in points){
        
        [poly addPointToPath:point];
    }
    
    AGSSimpleLineSymbol *outlineSymbol = [[AGSSimpleLineSymbol alloc]init];
    outlineSymbol.color = color;
    outlineSymbol.width = 5;
    outlineSymbol.style = AGSSimpleLineSymbolStyleInsideFrame;
    
    AGSGraphic *graphic = [[AGSGraphic alloc]initWithGeometry:poly symbol:outlineSymbol attributes:nil];
    [symbolLayer addGraphic:graphic];
    [symbolLayer refresh];
    
    [mapView zoomToGeometry:poly withPadding:0 animated:true];
    [mapView addMapLayer:symbolLayer withName:CAR_LINE_LAYER_NAME];
    
    if (points.count > 0){
        
        //驾车/公交路线起点
        [self showOriginOrDestionPointOnMapView:points[0] andMapView:mapView andImageName:startImageName andLayerName:CAR_LINE_ORIGIN_LAYER_NAME];
    }
    
    if(points.count > 1){
        //驾车/公交路线终点
        [self showOriginOrDestionPointOnMapView:points.lastObject andMapView:mapView andImageName:endImageName andLayerName:CAR_LINE_DESTION_LAYER_NAME];
    }

}

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
(nonnull NSString *)endImageName{
    
    NSString *lonlat = [[NSString alloc]init];
    
    if(buseLine.segments != nil){
        
        for (BusSegment *segment in buseLine.segments){
            
            if (segment.segmentLine != nil){
                
                for (BusSegmentLine * busSegmentLine in segment.segmentLine){
                    if(busSegmentLine.linePoint != nil){
                        lonlat = [lonlat stringByAppendingString:busSegmentLine.linePoint];
                    }
                }
            }
        }
    }

    //经纬度字符串转换成经纬度坐标数组
   NSArray< AGSPoint *> *points = [self tramfortLonlatSToPoints:lonlat andMapView:mapView];
    
    if (points != nil &points.count >0){
        //绘制路线图
        [self drawLineOnMapView:points andColor:lineColor andMapView:mapView andStartImageName:startImageName andEndImageName:endImageName];
    }
}



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
(nonnull NSString *)endImageName{
    
    // 获取驾车经纬度字符串
    if(carline.routelatlon != nil){
        //经纬度字符串转换成经纬度坐标数组
        NSArray<AGSPoint *> *points = [ self tramfortLonlatSToPoints:carline.routelatlon andMapView:mapView];
        
        if (points != nil && points.count > 0){
            //绘制线路
            [self drawLineOnMapView:points andColor:lineColor andMapView:mapView andStartImageName:startImageName andEndImageName:endImageName];
        }
        
    }
}



/**
 *  @author crash         crash_wu@163.com   , 16-08-31 16:08:15
 *
 *  @brief   将坐标字符串转换成坐标数组
 *
 *  @param lonlats 坐标字符串
 *  @param mapView 地图
 *
 *  @return 返回坐标数组
 */
-(nonnull NSArray<AGSPoint *> *)tramfortLonlatSToPoints:
(nonnull NSString *)lonlats andMapView:
(nonnull AGSMapView *)mapView{
    
    NSMutableArray<NSString *> *lonlatArray = [lonlats componentsSeparatedByString:@";"];
    
    NSMutableArray<AGSPoint *> *points = [NSMutableArray array];
    
    if (lonlatArray != nil && lonlatArray.count > 0){
        //去除最后一个数据
        [lonlatArray removeLastObject];
        
        for(NSString * lonlatString in lonlatArray){
            
            NSArray<NSString *> *pointString = [lonlatString componentsSeparatedByString:@","];
            
            if (pointString != nil && pointString.count > 0){
                
               AGSPoint *point = [[AGSPoint alloc]initWithX:[pointString[0] doubleValue] y:[pointString[1] doubleValue] spatialReference:mapView.spatialReference];
                
                //判断坐标系
                if(mapView.spatialReference.isAnyWebMercator){
                    //墨卡托坐标
                    point = [point webpointToWS84point];
                }
                
                [points addObject:point];
            }
        }
    }
    
    return  points;
}



/**
 *  @author crash         crash_wu@163.com   , 16-08-31 16:08:37
 *
 *  @brief 绘制驾车路线起点终点坐标样式
 *
 *  @param point     起点终点坐标名称
 *  @param mapView   地图
 *  @param imageName 起点终点图标
 *  @param layerName 图层名称
 */
-(void)showOriginOrDestionPointOnMapView:
(nonnull AGSPoint *)point andMapView :
(nonnull AGSMapView *)mapView andImageName:
(nonnull NSString *)imageName andLayerName:
(nonnull NSString *)layerName{
    
    AGSGraphicsLayer *symbolLayer = [[AGSGraphicsLayer alloc]init];
    
    AGSPictureMarkerSymbol *graphicSymbol = [[AGSPictureMarkerSymbol alloc]initWithImageNamed:imageName];
    NSDictionary *attribute = @{@"type" :@"originOrDestion"};
    
    AGSGraphic *graphic = [[AGSGraphic alloc]initWithGeometry:point symbol:graphicSymbol attributes:attribute];
    [symbolLayer addGraphic:graphic];
    [symbolLayer refresh];
    [mapView addMapLayer:symbolLayer withName:layerName];
    
}



/**
 *  @author crash         crash_wu@163.com   , 16-08-31 17:08:45
 *
 *  @brief 将地图缩放到第10级
 *
 *  @param mapView 地图
 */
-(void)zoomTo10Level:(nonnull AGSMapView *)mapView{
    
    //判断图层坐标系
    if(mapView.spatialReference.isAnyWebMercator){
       //web墨卡托坐标
        [mapView zoomToScale:577791.7098721985 animated:true ];
    }else{
        
        //经纬度坐标
        [mapView zoomToScale:577791.7098721985 animated:true ];
    }
}

@end
