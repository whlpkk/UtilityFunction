//
//  GDLocationViewController.m
//  s
//
//  Created by wjt on 15/6/29.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "GDLocationViewController.h"

@interface GDLocationViewController ()<MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@end

@implementation GDLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    //开启定位
    self.mapView.showsUserLocation = YES;
    
    //定位图层的模式
    /*
     MAUserTrackingModeNone不跟随用户位置,仅在地图上显示
     MAUserTrackingModeFollow跟随用户位置移动,并将定位点设置成地图中心点
     MAUserTrackingModeFollowWithHeading跟随用户的位置和角度移动
     */
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //设置地图的缩放比例
    self.mapView.zoomLevel = 19.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当位置更新时,会进定位回调,通过回调函数,能获取到定位点的经纬度坐标
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
//    if (updatingLocation) {
//        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
//    }
}

@end
