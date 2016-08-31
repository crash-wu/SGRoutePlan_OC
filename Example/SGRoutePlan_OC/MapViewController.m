//
//  MapViewController.m
//  SGRoutePlan_OC
//
//  Created by 吴小星 on 16/8/26.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@property(nonatomic,strong) TdtPOISearchKeyWord *poiKey;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = false;
    
    self.mapView = [[AGSMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
    
    
    self.poiBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:self.poiBtn];
    self.poiBtn.frame = CGRectMake(0, 0, 70, 50);
    [self.poiBtn setTitle:@"搜银行" forState:UIControlStateNormal];
    [self.poiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.poiBtn.backgroundColor = [UIColor blueColor];
    [self.poiBtn addTarget:self action:@selector(poiSearch:) forControlEvents:UIControlEventTouchUpInside];
    
    [[SGTileLayerUtil sharedInstance] loadTdtTileLayer:WMTS_VECTOR_2000 andMapView:self.mapView];
    
    [self zoomToChineseEnvelopeCGCS2000];
}


-(void) zoomToChineseEnvelopeCGCS2000{
    
    [self.mapView zoomToEnvelope:[[AGSEnvelope alloc] initWithXmin:80.76016586869 ymin:8.37639403682149 xmax:145.522396132932 ymax:52.9004273434877 spatialReference:self.mapView.spatialReference] animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)poiSearch:(UIButton *)button{
    
    self.poiKey = [[TdtPOISearchKeyWord alloc] init];
    
    self.poiKey.queryType = POI;
    self.poiKey.count = 20;
    self.poiKey.keyWord = @"银行";
    self.poiKey.start = 0;
    self.poiKey.mapBound = [[SGRoutePlanUtil sharedInstance] getMapBound:self.mapView];
    self.poiKey.level = 14;
    
    [SVProgressHUD showWithStatus:@"正在请求"];
    [[SouthgisTdtMapService shareInstance] poiSearch:self.poiKey success:^(NSArray<TdtPOIResult *> * _Nullable array) {
        [SVProgressHUD showSuccessWithStatus:@"成功"];
        
    } failed:^(id obj) {
        [SVProgressHUD showErrorWithStatus:@"失败"];
    }];
    
}


@end
