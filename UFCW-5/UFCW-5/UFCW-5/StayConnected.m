//
//  StayConnected.m
//  UFCW 5
//
//  Created by Avialdo on 30/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "StayConnected.h"
#import "SocialWebView.h"
#import "checkInternet.h"


@interface StayConnected (){
    NSArray *stayConnectedArray;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    NSArray * SocialItemIcons;
    UIImage * SocialIconImage;
    NSMutableArray *SocialItemsArray;
    UIImageView *SocialIconImageView;
    UILabel *SocialItemLabel;
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
    
    self.stay_connected.delegate = self;
    self.stay_connected.dataSource = self;
    
    SocialItemsArray = [[NSMutableArray alloc]initWithObjects:
                      @"Twitter",@"Facebook",@"Youtube",@"Instagram",nil];
    SocialItemIcons = [[NSArray alloc] initWithObjects:@"news",@"negotiation",@"member",@"events", nil];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [SocialItemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    SocialIconImage = [UIImage imageNamed:[SocialItemIcons objectAtIndex:indexPath.row]];
    
    tableView.separatorColor = [UIColor colorWithRed:204.0f/255.0f green:208.0f/255.0f blue:211.0f/255.0f alpha:1.0f];
    
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *stringForCell;
    
    stringForCell= [SocialItemsArray objectAtIndex:indexPath.row];
    
    SocialIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 25, 25)];
    
    SocialIconImageView.image = SocialIconImage;
    [cell addSubview:SocialIconImageView];
    
    SocialItemLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 200, 30)];
    SocialItemLabel.text = stringForCell;
    SocialItemLabel.font = [UIFont fontWithName:@"Calibri" size:18];
    SocialItemLabel.textColor = [UIColor colorWithRed:168.0f/255.0f green:175.0f/255.0f blue:181.0f/255.0f alpha:1.0f];
    
    [cell addSubview:SocialItemLabel];
    
    return cell;
}


#pragma mark - TableView delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"callWebView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSIndexPath *indexPath = [self.stay_connected indexPathForSelectedRow];
    SocialWebView *s = segue.destinationViewController;
    if([segue.identifier isEqualToString:@"callWebView"])
    {
        s.webViewNumber = indexPath.row;
        
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
