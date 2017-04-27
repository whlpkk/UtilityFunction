//
//  GDAnnotationViewController.m
//  s
//
//  Created by wjt on 15/6/29.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "GDAnnotationViewController.h"

@interface GDAnnotationViewController ()<MAMapViewDelegate>
@property (strong, nonatomic) MAMapView *mapView;

@end

@implementation GDAnnotationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];


    //默认的大头针
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"方恒国际";
    pointAnnotation.subtitle = @"阜通东大街 6 号";
    [_mapView addAnnotation:pointAnnotation];

    //地图缩放比例
//    self.mapView.zoomLevel = 15.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置标注样式
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    //默认大头针
    //    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
    //        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
    //        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
    //        if (annotationView == nil) {
    //            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
    //        }
    //        annotationView.canShowCallout= YES; //设置气泡可以弹出,默认为 NO
    //        annotationView.animatesDrop = YES; //设置标注动画显示,默认为 NO
    //        annotationView.draggable = YES; //设置标注可以拖动,默认为 NO
    //        annotationView.pinColor = MAPinAnnotationColorPurple;
    //        return annotationView;
    //    }

    //自定义大头针
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];

        if (annotationView == nil) {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }

        annotationView.canShowCallout = YES;
        annotationView.draggable = YES;

        annotationView.image = [UIImage imageNamed:@"greenPin_lift"];
        //设置中心心点偏移,使得标注底部中间点成为经纬度对应点
        //        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }

    return nil;
}

@end
