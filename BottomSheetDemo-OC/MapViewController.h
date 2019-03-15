//
//  MapViewController.h
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/14.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController<MKMapViewDelegate>
@property(nonatomic,strong) MKMapView *mapView;
@property(nonatomic,strong) CLLocationManager *manager;
@end

NS_ASSUME_NONNULL_END
