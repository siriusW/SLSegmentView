//
//  SLSegmentedView.h
//  标签视图
//
//  Created by wenshl on 15/7/22.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  SLSegmentViewDelegate用来处理点击事件
 */
@protocol SLSegmentViewDelegate <NSObject>
-(void)didTap:(NSInteger)index;
@end

@interface SLSegmentedView : UIView

/*标签的个数*/
@property(nonatomic,assign)NSInteger tabCount;

/*SLSegmentView的代理*/
@property(nonatomic,assign)id<SLSegmentViewDelegate> delegate;

/*选取的标签颜色*/
@property(nonatomic,strong)UIColor *selectColor;


/**
 *  设置标签的内容
 *
 *  @param tabArr 存放所有标签内容的数组
 */
-(void)setTabData:(NSArray *)tabArr;
@end
