//
//  ViewController.m
//  GCDTest
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 GCD==grand(宏大) central(中央) diapatch(处理器)
 苹果推出出的多线程解决方法
 会自动利用空闲的CPU 分配队列到指定的空闲CPU上去执行
 开发人员只需要遵循对应队列原则就可以实现自己想要的事件，至于怎么处理事件，GCD会帮助开发人员完成。
 CGD 有很多，dispatch队列，开发者也可以自己创建任意多个队列
 
 队列分为：
 1.串行队列（创建）：
 2.并行队列（获取）：
 3.主线队列（获取）：
队列遵循（FIFO）原则：先进先出
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //串行队列 创建队列 dispatch_queue_t
    //创建队列名==为当前队列赋值（3选1）
    /*
     串行队列==就是按照创建的顺序执行事件，如遇某一事件执行时间过长，就要等待期执行完====不建议使用
     dispatch_queue_create(<#const char *label#>, <#dispatch_queue_attr_t attr#>)
     dispatch_queue_create(C的字符串==一般填URl, 一般为NULL)
     
     */
//    dispatch_queue_t qu=dispatch_queue_create("com.baidu.www", NULL);
    //异步实现
//    dispatch_async(qu, ^{
//        NSLog(@"==1==%d",[NSThread isMainThread]);//分线程
//    });
    //同步实现
//    dispatch_sync(qu, ^{
//         NSLog(@"==2==%d",[NSThread isMainThread]);//主线程
//    });
    
    
    
    
    //并行队列==主要用于下载
    /*
      dispatch_queue_t qu=[dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)
     顺序：
     DISPATCH_QUEUE_PRIORITY_HIGH 2
     DISPATCH_QUEUE_PRIORITY_DEFAULT 0==会把耗时较长的事件放到队列的末尾，优先处理耗时短的事件
     DISPATCH_QUEUE_PRIORITY_LOW (-2)
      dispatch_queue_t qu=[dispatch_get_global_queue(执行队列的顺序, <#unsigned long flags#>)
     */
//    dispatch_queue_t qu=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(qu, ^{
//        NSLog(@"-1------%d",[NSThread isMainThread]);
//    });
//    dispatch_sync(qu, ^{
//        NSLog(@"-2------%d",[NSThread isMainThread]);
//    });
    //主线程队列==用于刷新UI====PS：主线程队列不可以用同步的Block，不然就会不执行
//    dispatch_queue_t que=dispatch_get_main_queue();
//    dispatch_async(que, ^{
//        NSLog(@"_1______%d",[NSThread isMainThread]);
//    });
//    dispatch_sync(que, ^{
//        NSLog(@"__2_____%d",[NSThread isMainThread]);
//    });
    
  __block  Test *ts=[[Test alloc]init];
    NSLog(@"0+1++++%lu",(unsigned long)ts.retainCount);
    NSLog(@"1+1++++%p",ts);
    NSLog(@"2+1++++%p",&ts);
    
    //
    [self test:ts];
    
    
}
//在使用GCD的时候，指针以形参的形式传递过来，不管是局部的还是全局的或者用__block 修饰的，在操作队列里面进行访问，引用计数都会被retain，指针会被copy
-(void)test:(Test *)aTest
{

dispatch_async(dispatch_get_main_queue(), ^{
    NSLog(@"0+2++++%lu",(unsigned long)aTest.retainCount);
    NSLog(@"1+2++++%p",aTest);
    NSLog(@"2+2++++%p",&aTest);

});
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
