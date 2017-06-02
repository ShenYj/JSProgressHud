//
//  ViewController.m
//  JSProgressHUD
//
//  Created by ShenYj on 2017/5/26.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import "ViewController.h"
#import "JSProgressHUD.h"
//#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor js_randomColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [[JSProgressHUD sharedProgressHUD] js_showHUDTo:self.view animated:YES];
    [[JSProgressHUD sharedProgressHUD] hideAnimated:YES afterDelay:3];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


