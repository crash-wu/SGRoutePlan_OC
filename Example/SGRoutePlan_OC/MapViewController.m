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

@property(nonatomic,strong,nonnull) BusLineSearch *busKey;

@property(nonatomic,strong,nonnull) CarLineSearch *carKey;

@property(nonatomic,strong,nonnull) ReverseAddressSearchKeyword *gecodeKey;

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
    
    self.busBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:self.busBtn];
    self.busBtn.frame = CGRectMake(70, 0, 70, 50);
    [self.busBtn setTitle:@"公交" forState:UIControlStateNormal];
    [self.busBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.busBtn.backgroundColor = [UIColor blueColor];
    [self.busBtn addTarget:self action:@selector(busSearch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.carBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:self.carBtn];
    self.carBtn.frame = CGRectMake(140, 0, 70, 50);
    [self.carBtn setTitle:@"驾车" forState:UIControlStateNormal];
    [self.carBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.carBtn.backgroundColor = [UIColor blueColor];
    [self.carBtn addTarget:self action:@selector(carSearch:) forControlEvents:UIControlEventTouchUpInside];
    
    self.getCode = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:self.getCode];
    self.getCode.frame = CGRectMake(210, 0, 70, 50);
    [self.getCode setTitle:@"逆地址" forState:UIControlStateNormal];
    [self.getCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.getCode.backgroundColor = [UIColor blueColor];
    [self.getCode addTarget:self action:@selector(getCodeSearch:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    [[SGTileLayerUtil sharedInstance] loadTdtTileLayer:WMTS_VECTOR_2000 andMapView:self.mapView];
    
    [self zoomToChineseEnvelopeCGCS2000];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.resultView = [[GetCodeResultView alloc ]initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 100) ];
    [self.view addSubview:self.resultView];
    self.resultView.hidden = YES;
}


-(void) zoomToChineseEnvelopeCGCS2000{
    
    [self.mapView zoomToEnvelope:[[AGSEnvelope alloc] initWithXmin:80.76016586869 ymin:8.37639403682149 xmax:145.522396132932 ymax:52.9004273434877 spatialReference:self.mapView.spatialReference] animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getCodeSearch:(UIButton *)button{
    [SVProgressHUD showWithStatus:@"加载.."];
    __weak typeof(&* self)weak = self;
    self.gecodeKey = [[ReverseAddressSearchKeyword alloc]init  ];
    self.gecodeKey.lon = 113.3714941059775;
    self.gecodeKey.lat = 23.06889937192582;
    [[SGRoutePlanService shareInstance]getCode:self.gecodeKey success:^(ReverseAddress *address) {
        
        [SVProgressHUD showSuccessWithStatus:@"成功"];
        
        
        __strong typeof(&*self) strong = weak;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            strong.resultView.hidden = NO;
            strong.resultView.nameLb.text = address.addressComponent.poi;
            strong.resultView.addressLb.text = address.formatted_address;
            
        });

        
    } fail:^(id obj) {
        [SVProgressHUD showErrorWithStatus:@"失败"];
    }];
}

-(void)poiSearch:(UIButton *)button{
    
    self.poiKey = [[TdtPOISearchKeyWord alloc] init];
    
    self.poiKey.queryType = POI;
    self.poiKey.count = 20;
    self.poiKey.keyWord = @"银行";
    self.poiKey.start = 0;
    self.poiKey.mapBound = [[SGRoutePlanUtil sharedInstance] getMapBound:self.mapView];
    self.poiKey.level = 14;
    
    __weak  typeof(&*self) weak = self;
    [SVProgressHUD showWithStatus:@"正在请求"];
    [[SGRoutePlanService shareInstance] poiSearch:self.poiKey success:^(NSArray<TdtPOIResult *> * _Nullable array) {
        [SVProgressHUD showSuccessWithStatus:@"成功"];
        
        [[SGRoutePlanUtil sharedInstance] showPOIResultsLayer:array andMapView:weak.mapView andImageName:@"list_numb_img"];
    } failed:^(id obj) {
        [SVProgressHUD showErrorWithStatus:@"失败"];
    }];
    
}

-(void)busSearch:(UIButton *)button{

    [SVProgressHUD showWithStatus:@"搜索"];
    self.busKey = [[BusLineSearch alloc]init];
    self.busKey.startposition = @"113.3714941059775,23.06889937192582";
    self.busKey.endposition = @"113.3796739596069,23.10052194023985";
    self.busKey.linetype = SpeedyType;
    __weak typeof(&*self) weak = self;
    
    [[SGRoutePlanService shareInstance] busLineSearch:self.busKey success:^(NSArray<BusLine *> * _Nullable array) {
        
        [SVProgressHUD showSuccessWithStatus:@"成功"];
        
        if (array.count > 0){
            [[SGRoutePlanUtil sharedInstance]drawBusLine: array[0] andMapView:weak.mapView andColor:[UIColor blueColor] andStartImage:@"start_popo" andEndImage:@"end_popo"];
        }

        
    } failed:^(id obj) {
        
        [SVProgressHUD showErrorWithStatus:@"失败"];
    }];

}

-(void)carSearch:(UIButton *)button{
    
    self.carKey = [[CarLineSearch alloc] init  ];
    self.carKey.orig = @"113.3714941059775,23.06889937192582";
    self.carKey.dest = @"113.3796739596069,23.10052194023985";
    self.carKey.style =  FastType;
    
    __weak typeof( &*self) weak = self;
    
    [[SGRoutePlanService shareInstance] carLineSearch:self.carKey success:^(CarLine * _Nullable array) {
        
        [[SGRoutePlanUtil sharedInstance] drawDriveLine:array andMapView:weak.mapView andColor:[UIColor blueColor] andStartImage:@"start_popo" andEndImage:@"end_popo"];
        
    } andFail:^(id obj) {
        
    }];
    
}

@end
