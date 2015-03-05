//
//  UIViewController_SocialWebView.h
//  UFCW 5
//
//  Created by Avialdo on 30/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialWebView : UIViewController

@property int webViewNumber;
@property (weak,nonatomic) NSString *string;
@property (weak, nonatomic) IBOutlet UIWebView *socialSiteWebView;
@end
