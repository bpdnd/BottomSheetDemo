//
//  MapViewController.m
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/14.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue]>=8.0) {
        [self.manager requestWhenInUseAuthorization];
    }

    self.mapView.mapType  = MKMapTypeStandard;

}
-(CLLocationManager *)manager{
    if (!_manager) {
        _manager = [[CLLocationManager alloc] init];
    }
    return _manager;
}
-(MKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        //用户位置
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
        //旋转
        _mapView.rotateEnabled = NO;
        [self.view addSubview:_mapView];
    }
    return _mapView;
}

    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
