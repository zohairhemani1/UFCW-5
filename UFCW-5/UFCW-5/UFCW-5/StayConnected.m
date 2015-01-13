//
//  StayConnected.m
//  UFCW 5
//
//  Created by Avialdo on 26/11/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "StayConnected.h"
#import "WebService.h"
#import "checkInternet.h"
#import "Constants.h"

@interface StayConnected (){
    NSArray *stayConnectedArray;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    UILabel * name;
    UILabel * designation;
    UILabel * address;
    UILabel * phoneNumberOne;
    UILabel * phoneNumberTwo;
    UILabel * faxNumber;
    UILabel * email;
}

@end

@implementation StayConnected

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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    loader = [checkInternetObj indicatorprogress:loader];
    [self.view addSubview:loader];
    [loader bringSubviewToFront:self.view];
    
    dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
    dispatch_async(myqueue, ^(void) {
        
        [loader startAnimating];
        if([checkInternetObj internetstatus] == TRUE){
            WebService *stayConnectedRest = [[WebService alloc] init];
            stayConnectedArray = [[NSArray alloc] initWithArray:[stayConnectedRest FilePath:BaseURL STAY_CONNECTED parameterOne:APP_ID]];
        }
        //NSString *subString = [@"" substringToIndex:rangeOfYourString.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update UI on main queue
            
            [self->stayConnected reloadData];
            [loader stopAnimating];
        });
        
    });

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [stayConnectedArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Stay Connected";
    
    UITableViewCell *cell;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    name = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 15)];
    name.text = @"Zohair Hemani";
    name.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
    
    [cell addSubview:name];
    
    
    address = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 300, 35)];
    address.text = [[stayConnectedArray valueForKey:@"address"] objectAtIndex:indexPath.row];
    address.numberOfLines = 3;
    address.font = [UIFont fontWithName:@"Calibri" size:16];
    [cell addSubview:address];
    
    
    phoneNumberOne = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 200, 15)];
    phoneNumberOne.text = [[stayConnectedArray valueForKey:@"phone_no1"] objectAtIndex:indexPath.row];
    phoneNumberOne.font= [UIFont fontWithName:@"Calibri" size:16];
    [cell addSubview:phoneNumberOne];
    
    
    return cell;
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
