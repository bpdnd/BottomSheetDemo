//
//  BottomSheetContainerView.m
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/15.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "BottomSheetContainerView.h"
@interface BottomSheetContainerView()
@property(nonatomic,strong) UIView *mainView;
@property(nonatomic,strong) UIView *sheetBackView;
@property(nonatomic,strong) UIView *sheetView;
@end
@implementation BottomSheetContainerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initWithMainView:(UIView *)mainView sheetBackView:(UIView *)sheetBackView sheetView:(UIView *)sheetView{
    self.mainView      = mainView;
    self.sheetBackView = sheetBackView;
    self.sheetView     = sheetView;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(self.sheetBackView.bounds, [self.sheetBackView convertPoint:point fromView:self])) {
        return [self.sheetView hitTest:[self.sheetView convertPoint:point fromView:self]withEvent:event];
    }
    return [self.mainView hitTest:[self.mainView convertPoint:point fromView:self]withEvent:event];
}
@end
