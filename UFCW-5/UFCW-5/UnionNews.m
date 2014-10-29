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
#import <CoreText/CoreText.h>

@interface UnionNews (){
    NSArray * NewsUnionArray;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    NSString *descriptionFromJson;
    NSMutableAttributedString *attrString;
    int bTag;
    int bClosingTag;
    int length;
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
    self.unionTable.delegate =self;
    self.unionTable.dataSource = self;
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];

    loader = [checkInternetObj indicatorprogress:loader];
    [self.view addSubview:loader];
    [loader bringSubviewToFront:self.view];
    
    dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
    dispatch_async(myqueue, ^(void) {
        
        [loader startAnimating];
        WebService *NewsUnionService = [[WebService alloc] init];
        NewsUnionArray = [[NSArray alloc] initWithArray:[NewsUnionService FilePath:BaseURL NewsUnion parameterOne:nil]];
        
        //NSString *subString = [@"" substringToIndex:rangeOfYourString.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update UI on main queue
            
            [self.unionTable reloadData];
            [loader stopAnimating];
        });
        
    });
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    NSRange range = NSMakeRange(0, [descriptionFromJson length]);
    
    bTag = [self stringToParse:descriptionFromJson matchString:@"<b>" rangeToParse:range];
    bClosingTag = [self stringToParse:descriptionFromJson matchString:@"</b>" rangeToParse:range];
    length = bClosingTag - bTag;
        
    NSRange boldedRange = NSMakeRange(bTag, length);
        
    attrString = [[NSMutableAttributedString alloc] initWithString:descriptionFromJson];
        
    [attrString beginEditing];
    [attrString addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:12.0f]} range:boldedRange];
    [attrString endEditing];
     
    
    
    //draw attrString here...
    //cell.textLabel.text = [[NewsUnionArray valueForKey:@"description"] objectAtIndex:indexPath.section];
    cell.textLabel.attributedText = attrString;
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.sectionHeaderHeight = 30;
    return [[NewsUnionArray valueForKey:@"title"] objectAtIndex:section];
}

-(int) stringToParse:(NSString*)stringToParse matchString:(NSString*)matchString rangeToParse:(NSRange)rangeToParse
{
    
    NSString *searchKeyword = matchString;
    NSRange range = rangeToParse;
    
    NSRange rangeOfYourString = [[stringToParse substringWithRange:range] rangeOfString:searchKeyword];
    
    if(rangeOfYourString.location == NSNotFound)
    {
        NSLog(@"No Match Found");
    }
    else
    {
    
        if([matchString  isEqual: @"</b>"])
        {
            unsigned long int endingIndex = rangeOfYourString.location;
            unsigned long int totalLengthToParse = (([stringToParse length] - endingIndex));
            
            NSRange nextRange = NSMakeRange(endingIndex, totalLengthToParse);
            
            NSString *remaingStringToParse = [stringToParse substringWithRange:nextRange];
            NSRange newRange = NSMakeRange(0, [remaingStringToParse length]);
            
            NSLog(@"RemaingStringToParse: %@",remaingStringToParse);
            
            [self stringToParse:remaingStringToParse matchString:@"<b>" rangeToParse:newRange];
            
            
        }
        else
        {
            NSRange newRange = NSMakeRange(rangeOfYourString.location, [stringToParse length]-rangeOfYourString.location);
            NSString *remString = [stringToParse substringWithRange:newRange];
            NSLog(@"Bold Tag: %@", remString);
            
            NSRange nRange = NSMakeRange(0, [remString length]);
            
            [self stringToParse:remString matchString:@"</b>" rangeToParse:nRange];
            

        }
    }
    
    return rangeOfYourString.location;
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
