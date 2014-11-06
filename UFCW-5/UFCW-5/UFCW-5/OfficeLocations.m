//
//  Office Locations.m
//  UFCW 5
//
//  Created by Avialdo on 06/11/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "OfficeLocations.h"

@interface OfficeLocations (){
    UILabel *OfficeTitle;
    UILabel *OfficeAddress;
    UILabel *OfficePhone;
}

@end

@implementation OfficeLocations


- (void)viewDidLoad
{
    [super viewDidLoad];
 

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
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Office Locations";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    OfficeTitle = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 200, 20)];
    OfficeTitle.text = @"Avialdo Office.";
    OfficeTitle.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
    
    [cell addSubview:OfficeTitle];
    
    
    OfficeAddress = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 300, 90)];
    OfficeAddress.text = @"343/3 D-3, 3rd Floor, Afshan Apartments, Karachi, Pakistan";
    OfficeAddress.numberOfLines = 2;
    OfficeAddress.font = [UIFont fontWithName:@"Calibri" size:18];
    [cell addSubview:OfficeAddress];
    
    
    OfficePhone = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    OfficePhone.text = @"Ph: +92-343-2637576";
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
