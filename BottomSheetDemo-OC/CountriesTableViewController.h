//
//  CountriesTableViewController.h
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/14.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveObjC.h"
NS_ASSUME_NONNULL_BEGIN

@interface CountriesTableViewController : UITableViewController
@property(nonatomic,strong) RACSubject *changeSubject;
@property(nonatomic,strong) RACSubject *didSelectSubject;

@end

NS_ASSUME_NONNULL_END
