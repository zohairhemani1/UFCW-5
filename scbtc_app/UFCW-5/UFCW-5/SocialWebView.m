//
//  SocialWebView.m
//  UFCW 5
//
//  Created by Avialdo on 30/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "SocialWebView.h"
#import "checkInternet.h"
#import "StayConnected.h"

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
    
    fullURL = [[[StayConnected social_links_array_function] valueForKey:@"link"] objectAtIndex:viewNumber];
    
    NSLog(@"url: %@", fullURL);
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    return requestObj;
}


@end
