//
//  ViewController.m
//  UIScrollViewAdvance
//
//  Created by Civet on 2019/5/21.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设定滚动视图的位置
    _scrollView = [[UIScrollView alloc] init];
    //设定滚动视图的位置
    _scrollView.frame = CGRectMake(10, 50, 300, 400);
    //取消弹动效果
    _scrollView.bounces = NO;
    //是否允许通过点击屏幕让滚动视图响应事件
    _scrollView.userInteractionEnabled = YES;
    //设置画布大小，纵向效果
    _scrollView.contentSize = CGSizeMake(300, 400*9);
    
    for (int i = 0; i < 9; i++){
        //生成图片名称
        NSString *strName = [NSString stringWithFormat:@"%d.jpg",i+1];
        UIImage *image = [UIImage imageNamed:strName];
        //创建图像视图对象
        UIImageView *iView = [[UIImageView alloc] init];
        //图像赋值
        iView.image = image;
        //设置图像视图在滚动视图画布中的位置
        iView.frame = CGRectMake(0, 400*i, 300, 400);
        [_scrollView addSubview:iView];
    }
    [self.view addSubview:_scrollView];
    //取消按页滚动效果
    _scrollView.pagingEnabled = YES;
    //滚动视图画布的移动位置，偏移位置
    //功能：决定画布显示的最终图像结果
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    _scrollView.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //_scrollView.contentOffset = CGPointMake(0, 0);
    //让滚动视图移动到指定位置，动画移动
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, 300, 400) animated:YES];
}

//当滚动视图移动时，只要offset坐标发生变化，都会调用此函数
//参数：调用此协议的滚动视图对象
//可以使用此函数来监控滚动视图的位置
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"y = %f",scrollView.contentOffset.y);
}
//当滚动视图结束拖动时调用此函数
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"Did End Drag!");
}
//滚动视图即将开始被拖动时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"Will Begin Drag!");
}
//视图即将结束拖动时调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"Will End Drag!");
}
//视图即将减速时调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Will begin Decelerate!");
}
//视图已经结束减速调用，视图停止的瞬间调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"视图停止移动!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
