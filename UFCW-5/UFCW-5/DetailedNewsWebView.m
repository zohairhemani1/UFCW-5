//
//  DetailedNewsWebView.m
//  UFCW-5
//
//  Created by Avialdo on 31/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "DetailedNewsWebView.h"
#import "Constants.h"
#import "checkInternet.h"

@interface DetailedNewsWebView (){
    checkInternet *checkInternetObj;
}

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
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    self.title =@"hello";
    
    NSLog(@"NEWS ID: %@",self.newsID);
    if([checkInternetObj internetstatus] == true){
        [_DetailedNewsWebView loadRequest:[self getURLRequest]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSURLRequest *)getURLRequest{
    
    NSString *fullURL = [[[BaseURL DETAILED_NEWS_URL stringByAppendingString:self.newsID] stringByAppendingString:DETAILED_NEWS_URL_SECOND_PARAMETER]stringByAppendingString:APP_ID];
    NSLog(@"url: %@", fullURL);
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
