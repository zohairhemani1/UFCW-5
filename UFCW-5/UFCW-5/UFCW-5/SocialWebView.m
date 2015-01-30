//
//  SocialWebView.m
//  UFCW 5
//
//  Created by Avialdo on 30/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "SocialWebView.h"
#import "checkInternet.h"

@interface SocialWebView ()
{
    checkInternet *checkInternetObj;
}

@end

@implementation SocialWebView

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    if([checkInternetObj internetstatus] == true)
    {
        [self.socialSiteWebView loadRequest:[self getURLRequest:self.webViewNumber]];
    }
}


-(NSURLRequest *)getURLRequest: (int)viewNumber{
    
    NSString *fullURL;
    
    if(viewNumber == 0)
    {
        fullURL = @"https://twitter.com";
    }
    else if (viewNumber == 1)
    {
        fullURL = @"https://www.facebook.com";
    }
    else if (viewNumber == 2)
    {
        fullURL = @"https://www.youtube.com";
    }
    else
    {
        fullURL = @"https://instagram.com";
    }
    NSLog(@"url: %@", fullURL);
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    return requestObj;
}


@end
