//
//  ViewController.m
//  WKWebViewCustomEditMenuBug
//
//  Created by David Wieringa on 10/20/15.
//  Copyright © 2015 Userwise Solutions. All rights reserved.
//

@import WebKit;
#import "ViewController.h"
#import "MyWKWebView.h"

@interface ViewController ()
@property (strong, nonatomic) MyWKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView = [[MyWKWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://en.wikipedia.org/wiki/Sailing"]];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
