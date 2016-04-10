//
//  ViewController.m
//  04.JSONKit
//
//  Created by 浅爱 on 16/3/2.
//  Copyright © 2016年 my. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    // 使用JSONKit的时候，要在项目设置中--Build Plasses --Complie Sources 中把JSONKit设置成arc模式
    // 设置信息  -fno-objc-arc
    [self getJSON];
    
}


- (void)getJSON {

    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       
        if (connectionError) {
            
            NSLog(@"connect error");
            
            return ;
            
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode == 200 || httpResponse.statusCode == 304) {
            
            id result = [[JSONDecoder decoder] objectWithData:data];
            
            NSLog(@"%@", [result class]);
            
        } else {
        
            NSLog(@"error");
        
        }
        
    }];

}


@end






