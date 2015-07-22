//
//  SLSegmentedView.m
//  标签视图
//
//  Created by wenshl on 15/7/22.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import "SLSegmentedView.h"


#define w [UIScreen mainScreen].bounds.size.width
#define h [UIScreen mainScreen].bounds.size.height

@interface SLSegmentedView ()
{
    NSArray *arrData;
    
}
//@property(nonatomic,assign)NSInteger tabCount;
@end
@implementation SLSegmentedView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTabView];
    }
    
    return  self;
}

-(void)setBottomView:(NSInteger)index{
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UILabel class]]) {
            [view removeFromSuperview];
        }
    }
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(index*w/_tabCount, self.bounds.size.height-4, w/_tabCount, 4)];
//    bottomView.backgroundColor = [UIColor greenColor];
   bottomView.backgroundColor = [self exsit:self.selectColor andObj:[UIColor greenColor]];

    [self addSubview:bottomView];
}

-(void)setTabView{
    for (int i=0; i<[arrData count]; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*w/_tabCount, 0, w/_tabCount, self.bounds.size.height)];
        label.userInteractionEnabled = YES;
        label.tag = 220+i;
        label.text = arrData[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        if (i==0) {
            label.textColor = [self exsit:self.selectColor andObj:[UIColor greenColor]];
        }
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action:)]];
        
        [self addSubview:label];
    }
}

-(void)action:(UIGestureRecognizer *)sender{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)view;
            label.textColor = [UIColor blackColor];
        }
    }
    
    UILabel *label = (UILabel *)sender.view;
    
    label.textColor = [self exsit:self.selectColor andObj:[UIColor greenColor]];
//    if (self.selectColor==nil) {
//        label.textColor = self.selectColor;
//    }else
//        label.textColor = [UIColor greenColor];

    [self setBottomView:label.tag-220];
    [self.delegate didTap:label.tag-220];
}

-(void)setTabData:(NSArray *)tabArr{
    arrData = [NSArray arrayWithArray:tabArr];
    [self setTabView];
    [self setBottomView:0];

}


-(UIColor *)exsit:(UIColor *)parme1 andObj:(UIColor *) parme2{
    if(parme1==nil)
        return parme2;
    else
        return parme1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
