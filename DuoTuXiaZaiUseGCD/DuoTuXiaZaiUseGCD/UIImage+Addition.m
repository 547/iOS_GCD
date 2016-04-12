//
//  UIImage+Addition.m
//  DuoTuXiaZaiUseGCD
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImageView (Addition)
-(void)download:(NSString *)urlSring
{
    __block UIImage *image1=nil;
    __block UIImage *image2=nil;
//    [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlSring]]];
    
   dispatch_queue_t que= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //队列组==把多个队列事件装到一个组里，以组为单位去执行
    dispatch_group_t group=dispatch_group_create();
    //下载两张图片,同时显示两张图片
    //参1，组名
    //参2，队列名
    dispatch_group_async(group, que, ^{
        //下载第一张图片
        image1=[self getImagWithUrl:urlSring];
    });
    dispatch_group_async(group, que, ^{
        //下载第二张图片
        image2=[self getImagWithUrl:urlSring];
    });
//group完成之后会调用的方法
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"=====%d",[NSThread isMainThread]);//分线程
        self.image=image1;
        self.image=image2;
        
        [image2 release];
        [image1 release];
        //mrc 下记得要释放
        dispatch_release(group);
        
    });
    dispatch_release(que);
}
//考虑到image1和image2赋值方法一样，所以整合成一个方法
-(UIImage *)getImagWithUrl:(NSString *)urlString
{
    NSData *da=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
//    [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]]
return [[UIImage alloc]initWithData:da];

}
@end
