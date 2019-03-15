//
//  ViewController.m
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/14.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "CountriesTableViewController.h"
#import "Masonry.h"
#import "ReactiveObjC.h"
#import "BottomSheetBackgroundView.h"
#import "BottomSheetContainerView.h"
@interface ViewController ()
@property(nonatomic,strong) BottomSheetContainerView *containerView;
@property(nonatomic,strong) MapViewController *mapVC;
@property(nonatomic,strong) BottomSheetBackgroundView *tableBackgroundView;
@property(nonatomic,strong) CountriesTableViewController *tableVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //1
    self.containerView.backgroundColor = [UIColor whiteColor];
    //2 地图
    self.mapVC.view.backgroundColor = [UIColor whiteColor];
    //3 table的背景图
    self.tableBackgroundView.backgroundColor =[UIColor whiteColor];
    //4 table控制器
    self.tableVC.tableView.backgroundColor = [UIColor clearColor];
    //5
    [self.containerView initWithMainView:self.mapVC.view sheetBackView:self.tableBackgroundView sheetView:self.tableVC.view];
    
    //动态修改背景view的尺寸
    self.tableVC.changeSubject = [RACSubject subject];
    @weakify(self);
    [self.tableVC.changeSubject subscribeNext:^(NSString * x) {
        @strongify(self);
        [self.tableBackgroundView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableVC.tableView.mas_top).offset([x doubleValue] < 0 ?-[x doubleValue]:0);
        }];
        [self.tableBackgroundView layoutIfNeeded];
    }];
    
    self.tableVC.didSelectSubject = [RACSubject subject];
    [self.tableVC.didSelectSubject subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        UIViewController *twoVC = [[NSClassFromString(@"TwoViewController") alloc] init];
        [self presentViewController:twoVC animated:YES completion:nil];
    }];
}
#pragma 懒加载
-(BottomSheetContainerView *)containerView{
    if (!_containerView) {
        _containerView = [[BottomSheetContainerView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_containerView];
    }
    return _containerView;
}
-(MapViewController *)mapVC{
    if (!_mapVC) {
        _mapVC = [[MapViewController alloc]init];
        [self addChildViewController:_mapVC];
        [_mapVC didMoveToParentViewController:self];
        _mapVC.view.frame = self.view.bounds;
        [self.containerView addSubview:_mapVC.view];
    }
    return _mapVC;
}
-(BottomSheetBackgroundView *)tableBackgroundView{
    if (!_tableBackgroundView) {
        _tableBackgroundView = [[BottomSheetBackgroundView alloc]init];
        [self.containerView addSubview:_tableBackgroundView];
        [_tableBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.containerView.mas_left).offset(0);
            make.right.equalTo(self.containerView.mas_right).offset(0);
            make.bottom.equalTo(self.containerView.mas_bottom).offset(0);
        }];
    }
    return _tableBackgroundView;
}
-(CountriesTableViewController *)tableVC{
    if (!_tableVC) {
        _tableVC = [[CountriesTableViewController alloc]init];
        [self addChildViewController:_tableVC];
        [_tableVC didMoveToParentViewController:self];
        [self.containerView addSubview:_tableVC.tableView];
        CGFloat statusHeight        = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
        if (navigationBarHeight == 0) {
            [_tableVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.containerView.mas_left).offset(0);
                make.top.equalTo(self.containerView.mas_top).offset(statusHeight);
                make.right.equalTo(self.containerView.mas_right).offset(0);
                make.bottom.equalTo(self.containerView.mas_bottom).offset(0);
            }];
        }else{
            [_tableVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.containerView.mas_left).offset(0);
                make.top.equalTo(self.containerView.mas_top).offset(0);
                make.right.equalTo(self.containerView.mas_right).offset(0);
                make.bottom.equalTo(self.containerView.mas_bottom).offset(0);
            }];
        }
    }
    return _tableVC;
}
@end
