//
//  WebViewController.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *iv = [[UIWebView alloc]initWithFrame:self.view.bounds];
    iv.delegate = self;
    [self.view addSubview:iv];
     NSString *path =@"http://v.17173.com/z_1_10898/MzQ3MDg4OTk.html";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    [iv loadRequest:request];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
