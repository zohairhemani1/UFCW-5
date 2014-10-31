//
//  DetailedNewsWebView.m
//  UFCW-5
//
//  Created by Avialdo on 31/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "DetailedNewsWebView.h"
#import "Constants.h"

@interface DetailedNewsWebView ()

@end

@implementation DetailedNewsWebView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_DetailedNewsWebView loadRequest:[self getURLRequest]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSURLRequest *)getURLRequest{
    NSString *fullURL = [BASEURL_WEBDASHBOARD DETAILED_NEWS_URL stringByAppendingString:@"134"];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    return requestObj;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
