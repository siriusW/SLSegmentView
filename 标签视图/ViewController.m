//
//  ViewController.m
//  标签视图
//
//  Created by wenshl on 15/7/22.
//  Copyright (c) 2015年 wenshl. All rights reserved.
//

#import "ViewController.h"
#import "SLSegmentedView.h"

@interface ViewController ()<SLSegmentViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SLSegmentedView *segmentView = [[SLSegmentedView alloc] initWithFrame:CGRectMake(0, 0, 375, 60)];
    [segmentView setTabCount:4];
    segmentView.delegate = self;
    segmentView.backgroundColor = [UIColor grayColor];
    [segmentView setTabData:@[@"美食",@"电影",@"杂志",@"动漫"]];
    
    [self.view addSubview:segmentView];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)didTap:(NSInteger)index{
    NSLog(@"点击第%ld个标签",index+1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
