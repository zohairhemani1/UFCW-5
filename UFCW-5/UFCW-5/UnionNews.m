//
//  UnionNews.m
//  UFCW-5
//
//  Created by Zohair Hemani on 21/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "UnionNews.h"
#import "Constants.h"
#import "WebService.h"
#import "checkInternet.h"
#import "DetailedNewsWebView.h"
#import <CoreText/CoreText.h>

@interface UnionNews ()
{
    NSMutableArray * NewsUnionArray;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    NSString *descriptionFromJson;
}

@end

@implementation UnionNews


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Cat: %@", self.category);
   
    self.unionTable.delegate =self;
    self.unionTable.dataSource = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
        if([checkInternetObj internetstatus] == TRUE && [checkInternetObj hoststatus]== TRUE){
            WebService *NewsUnionService = [[WebService alloc] init];
            NSLog(@"the category is %@",self.category);
            NewsUnionArray = [[NSMutableArray alloc] initWithArray:[NewsUnionService FilePath:BaseURL NEWS_CATEGORY parameterOne:@"7" parameterTwo:APP_ID]];
        }
        //NSString *subString = [@"" substringToIndex:rangeOfYourString.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update UI on main queue
            
            [self.unionTable reloadData];
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
    return [NewsUnionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UnionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    descriptionFromJson = [[NewsUnionArray valueForKey:@"description"] objectAtIndex:indexPath.section];
    if(![descriptionFromJson isKindOfClass:[NSNull class]])
    {
        cell.textLabel.text = descriptionFromJson;
    }
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.sectionHeaderHeight = 30;
    return [[NewsUnionArray valueForKey:@"title"] objectAtIndex:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(15, 3, 300, 20);
    myLabel.font = [UIFont boldSystemFontOfSize:14];
    if(![[[NewsUnionArray valueForKey:@"title"] objectAtIndex:section] isKindOfClass:[NSNull class]])
    {
        myLabel.text = [[NewsUnionArray valueForKey:@"title"] objectAtIndex:section];
    }
    
    UIView *headerView = [[UIView alloc] init];
    [headerView setBackgroundColor:[UIColor lightTextColor]];
    [headerView addSubview:myLabel];
    
    return headerView;
}

#pragma mark - TableView delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"newsWebView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSIndexPath *indexPath = [self.unionTable indexPathForSelectedRow];
    
    DetailedNewsWebView *webView = segue.destinationViewController;
    //webView.newsID = [[self.unionTable indexPathForSelectedRow] row];
    webView.newsID = [[NewsUnionArray valueForKey:@"news_id"] objectAtIndex:[indexPath section]];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/





@end
