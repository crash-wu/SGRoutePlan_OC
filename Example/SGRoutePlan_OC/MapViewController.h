//
//  MapViewController.h
//  SGRoutePlan_OC
//
//  Created by 吴小星 on 16/8/26.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>
#import <SGTileLayer/SGTileLayerHeader.h>
#import <SGRoutePlan_OC/SGRoutePlanHeader.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface MapViewController : UIViewController

@property(nonnull,strong,nonatomic) AGSMapView *mapView;
@property(nonatomic,strong,nonnull) UIButton *poiBtn;


@end
