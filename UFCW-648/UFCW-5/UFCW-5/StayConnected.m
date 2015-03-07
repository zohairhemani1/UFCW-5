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
#import "WebService.h"
#import "Constants.h"


@interface StayConnected (){
    
    NSArray *stayConnectedArray;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    NSArray * SocialItemIcons;
    UIImage * SocialIconImage;
    NSMutableArray *SocialItemsArray;
    UIImageView *SocialIconImageView;
    UILabel *SocialItemLabel;
    NSMutableArray *categories;
}

@end

@implementation StayConnected

static NSArray *social_links_array;


+(NSArray *) social_links_array_function
{
    if(social_links_array == NULL)
    {
        social_links_array = [[NSArray alloc] init];
    }
    return social_links_array;
}

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
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    loader = [checkInternetObj indicatorprogress:loader];
    [self.view addSubview:loader];
    [loader bringSubviewToFront:self.view];
    
    SocialItemsArray = [[NSMutableArray alloc]initWithObjects:
                      @"Twitter",@"Facebook",@"Youtube",@"Instagram",nil];
    SocialItemIcons = [[NSArray alloc] initWithObjects:@"twitter",@"facebook",@"youtube",@"youtube", nil];
    
    categories = [[NSMutableArray alloc]initWithObjects:CategoriesArray, nil];
    
    NSString *path = [[[[BaseURL stringByAppendingString:EXTENDED_DETAILED_URL]stringByAppendingString:[categories objectAtIndex:7]]stringByAppendingString:@"&app_id="]stringByAppendingString:APP_ID];
    
    dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
    dispatch_async(myqueue, ^(void) {
        
        [loader startAnimating];
        if([checkInternetObj internetstatus] == TRUE){
            WebService *social_links = [[WebService alloc] init];
            social_links_array = [social_links FilePath:path parameterOne:nil];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.stay_connected reloadData];
            [loader stopAnimating];
        });
        
    });
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [[StayConnected social_links_array_function] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    SocialIconImage = [UIImage imageNamed:[[[StayConnected social_links_array_function] valueForKey:@"name"] objectAtIndex:indexPath.row]];
    
    tableView.separatorColor = [UIColor colorWithRed:204.0f/255.0f green:208.0f/255.0f blue:211.0f/255.0f alpha:1.0f];
    
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *stringForCell;
    
    stringForCell= [[[StayConnected social_links_array_function] valueForKey:@"name"] objectAtIndex:indexPath.row];
    
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
        s.webViewNumber = (int)indexPath.row;
        s.title = [[[StayConnected social_links_array_function] valueForKey:@"name"] objectAtIndex:indexPath.row];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
