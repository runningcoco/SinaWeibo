//
//  OAuthViewController.m
//  山寨新浪微博
//
//  Created by 大侠 on 15-3-26.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "OAuthViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "AccountTool.h"

@interface OAuthViewController () <UIWebViewDelegate>

@end

@implementation OAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建一个webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    // 2.用webView加载登录页面（新浪提供的）
    // 请求地址：https://api.weibo.com/oauth2/authorize
    /* 请求参数：
     client_id true string	申请应用时分配的AppKey。
     redirect_uri true string 授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
     */
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2953370592&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

#pragma mark - webView代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载..."];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 1.获得url
    NSString *url = request.URL.absoluteString;
    
    // 2.判断是否为回调地址
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) { // 是回调地址
        // 截取code=后面的参数值
        int fromIndex = range.location + range.length;
        NSString *code = [url substringFromIndex:fromIndex];
        
        // 利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        // 禁止加载回调地址
        return NO;
    }
    
    return YES;
}

/**
 *  利用code（授权成功后的request token）换取一个accessToken
 *
 *  @param code 授权成功后的request token
 */
- (void)accessTokenWithCode:(NSString *)code
{
    /*
     URL：https://api.weibo.com/oauth2/access_token
     
     请求参数：
     client_id：申请应用时分配的AppKey
     client_secret：申请应用时分配的AppSecret
     grant_type：使用authorization_code
     redirect_uri：授权成功后的回调地址
     code：授权成功后返回的code
     */
    
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // AFN的AFJSONResponseSerializer默认不接受text/plain这种类型
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"2953370592";
    params[@"client_secret"] = @"b72237a0bd2942650370ba1860393334";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"http://www.baidu.com";
    params[@"code"] = code;
    
    // 3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        [MBProgressHUD hideHUD];
        
        // 将返回的账号字典数据 -> 模型，存进沙盒
        Account *account = [Account accountWithDict:responseObject];
        // 存储账号信息
        [AccountTool saveAccount:account];
        
        //切换窗口的根控制器
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window switchRootViewController];
        
        // UIWindow的分类、WindowTool、UIViewController的分类、ControllerTool
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUD];
        HWLog(@"请求失败-%@", error);
    }];
}
@end
