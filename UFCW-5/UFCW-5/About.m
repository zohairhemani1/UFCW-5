//
//  About.m
//  UFCW 5
//
//  Created by Zohair Hemani on 17/02/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "About.h"


#import "checkInternet.h"
#import "StayConnected.h"

@interface About ()
{
    checkInternet *checkInternetObj;
}

@end

@implementation About

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
        [self.AboutWebView loadRequest:[self getURLRequest:self.webViewNumber]];
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
