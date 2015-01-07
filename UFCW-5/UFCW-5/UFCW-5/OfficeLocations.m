//
//  Office Locations.m
//  UFCW 5
//
//  Created by Avialdo on 06/11/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "OfficeLocations.h"
#import "WebService.h"
#import "checkInternet.h"
#import "Constants.h"

@interface OfficeLocations (){
    UILabel *OfficeTitle;
    UILabel *OfficeAddress;
    UILabel *OfficePhone;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    NSArray *officeLocationArray;

}

@end

@implementation OfficeLocations


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    loader = [checkInternetObj indicatorprogress:loader];
    [self.view addSubview:loader];
    [loader bringSubviewToFront:self.view];
    
    dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
    dispatch_async(myqueue, ^(void) {
        
        [loader startAnimating];
        WebService *officeLocation = [[WebService alloc] init];
        officeLocationArray = [[NSArray alloc] initWithArray:[officeLocation FilePath:BaseURL OFFICE_LOCATION parameterOne:APP_ID]];
        
        //NSString *subString = [@"" substringToIndex:rangeOfYourString.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update UI on main queue
            
            [self->officeLocations reloadData];
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
    return [officeLocationArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Office Locations";
    
    UITableViewCell *cell;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    OfficeTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 15)];
    OfficeTitle.text = [[officeLocationArray valueForKey:@"office_title"] objectAtIndex:indexPath.row];
    OfficeTitle.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
    
    [cell addSubview:OfficeTitle];
    
    
    OfficeAddress = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 300, 35)];
    OfficeAddress.text = [[officeLocationArray valueForKey:@"address"] objectAtIndex:indexPath.row];
    OfficeAddress.numberOfLines = 3;
    OfficeAddress.font = [UIFont fontWithName:@"Calibri" size:16];
    [cell addSubview:OfficeAddress];
    
    
    OfficePhone = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 200, 15)];
    OfficePhone.text = [[officeLocationArray valueForKey:@"phone_no"] objectAtIndex:indexPath.row];
    OfficePhone.font = [UIFont fontWithName:@"Calibri" size:16];
    [cell addSubview:OfficePhone];
    
    
    return cell;
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
