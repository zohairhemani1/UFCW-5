//
//  About.m
//  UFCW 5
//
//  Created by Zohair Hemani on 17/02/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "ExtendedWebView.h"
#import "checkInternet.h"
#import "StayConnected.h"
#import "Constants.h"

@interface ExtendedWebView ()
{
    checkInternet *checkInternetObj;
}

@end

@implementation ExtendedWebView

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
    
    if([checkInternetObj internetstatus] == true)
    {
        NSLog(@"the category in method is %@",self.CategoryIndex);
        
        [self.ExtendWebView loadRequest:[self getURLRequest]];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSURLRequest *)getURLRequest{
    
    NSLog(@"the category in method is %@",self.CategoryIndex);
    
    NSString *fullURL = [[[BaseURL EXTENDED_DETAILED_URL stringByAppendingString:self.CategoryIndex] stringByAppendingString:DETAILED_NEWS_URL_SECOND_PARAMETER]stringByAppendingString:APP_ID];
    NSLog(@"url: %@", fullURL);
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    return requestObj;

    
    return requestObj;
}


@end
