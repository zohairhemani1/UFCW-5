//
//  SubPage.m
//  UFCW-5
//
//  Created by Zohair Hemani on 20/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "SubPage.h"
#import "checkInternet.h"

@interface SubPage (){
    checkInternet *checkInternetObj;
}

@end

@implementation SubPage

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
    
    // Do any additional setup after loading the view.
    NSLog(@"Hello World From SubPage");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
