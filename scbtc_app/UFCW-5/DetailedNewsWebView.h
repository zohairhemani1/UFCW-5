//
//  DetailedNewsWebView.h
//  UFCW-5
//
//  Created by Avialdo on 31/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedNewsWebView : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *DetailedNewsWebView;
@property (weak,nonatomic) NSString * newsID;

@end
