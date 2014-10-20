//
//  ViewController.m
//  UFCW-5
//
//  Created by Avialdo on 18/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "ViewController.h"
#import "SubPage.h"

@interface ViewController ()
{
    NSArray * MenuItemIcons;
    UIImage * MenuIconImage;
    UIImageView *MenuIconImageView;
    UILabel *MenuItemLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    menuItemsArray = [[NSMutableArray alloc]initWithObjects:
              @"Union News",@"Negotiation Updates",@"Member Resources",@"Upcoming Events",@"Stay Connected",@"Shop Union",@"Office Locations", nil];
   MenuItemIcons = [[NSArray alloc] initWithObjects:@"news",@"negotiation-updates",@"member",@"events",@"connected",@"shopunion",@"location", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return [menuItemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    MenuIconImage = [UIImage imageNamed:[MenuItemIcons objectAtIndex:indexPath.row]];
    
    tableView.separatorColor = [UIColor colorWithRed:204.0f/255.0f green:208.0f/255.0f blue:211.0f/255.0f alpha:1.0f];
    
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *stringForCell;
 
    stringForCell= [menuItemsArray objectAtIndex:indexPath.row];
//    cell.textLabel.font = [UIFont fontWithName:@"Calibri" size:18];
//    [cell.textLabel setText:stringForCell];
//    cell.textLabel.textColor = [UIColor colorWithRed:168.0f/255.05 green:175.0f/255.0f blue:181.0f/255.0f alpha:1.0f];
    
    MenuIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 25, 25)];
    
    MenuIconImageView.image = MenuIconImage;
    [cell addSubview:MenuIconImageView];
    
    MenuItemLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 200, 30)];
    MenuItemLabel.text = stringForCell;
    MenuItemLabel.font = [UIFont fontWithName:@"Calibri" size:18];
    MenuItemLabel.textColor = [UIColor colorWithRed:168.0f/255.05 green:175.0f/255.0f blue:181.0f/255.0f alpha:1.0f];
    
    [cell addSubview:MenuItemLabel];
    
    return cell;
}


#pragma mark - TableView delegate

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
//(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"Section:%d Row:%d selected and its data is %@",
//          indexPath.section,indexPath.row,cell.textLabel.text);
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"SubPage" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   // SubPage *s = segue.destinationViewController;
    
}



@end
