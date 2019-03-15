//
//  BottomSheetBackgroundView.m
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/14.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "BottomSheetBackgroundView.h"
static CGFloat borderWidthNum = 1;
static CGFloat cornerRadiusNum = 10;

@implementation BottomSheetBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = cornerRadiusNum;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = borderWidthNum;
        self.layer.masksToBounds = YES;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width + borderWidthNum*2, self.bounds.size.height);
}


@end
