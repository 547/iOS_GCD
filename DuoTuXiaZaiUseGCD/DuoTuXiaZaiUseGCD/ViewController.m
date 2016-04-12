//
//  ViewController.m
//  DuoTuXiaZaiUseGCD
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)dealloc
{
    [super dealloc];
    [_image1 release];
    [_image2 release];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //http://img5.imgtn.bdimg.com/it/u=115697286,2847986213&fm=21&gp=0.jpg
    //http://img0.imgtn.bdimg.com/it/u=577333074,577007802&fm=21&gp=0.jpg
    
    [self.image1 download:@"http://c.hiphotos.baidu.com/image/h%3D300/sign=8ad8896b4a086e0675a8394b32097b5a/023b5bb5c9ea15ce0492f553b0003af33a87b26f.jpg"];
    
    [self.image2 download:@"http://img5.imgtn.bdimg.com/it/u=3131340016,2540563541&fm=11&gp=0.jpg"];

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
