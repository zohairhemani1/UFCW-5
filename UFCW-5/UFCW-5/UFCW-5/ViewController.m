//
//  ViewController.m
//  UFCW-5
//
//  Created by Avialdo on 18/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "ViewController.h"
#import "SubPage.h"
#import "UnionNews.h"
#import "Constants.h"
#import "checkInternet.h"
#import "ExtendedTableView.h"

@interface ViewController ()
{
    NSArray * MenuItemIcons;
    UIImage * MenuIconImage;
    UIImageView *MenuIconImageView;
    UILabel *MenuItemLabel;
    checkInternet *checkInternetObj;
    NSMutableArray *categories;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    categories = [[NSMutableArray alloc]initWithObjects:CategoriesArray, nil];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    self.logo_image.image = [UIImage imageNamed:LOGO_NAME];
    
    menuItemsArray = [[NSMutableArray alloc]initWithObjects:
              ListItemArray, nil];
    MenuItemIcons = [[NSArray alloc] initWithObjects:menuItemIcons, nil];
    
    [ImageView setBackgroundColor:[UIColor colorWithRed:NAV_RED_COLOR/255.0 green:NAV_GREEN_COLOR/255.0 blue:NAV_BLUE_COLOR/255.0 alpha:1.0]];
    
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
    
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *stringForCell;
 
    stringForCell= [menuItemsArray objectAtIndex:indexPath.row];
    
    MenuIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 25, 25)];
    
    MenuIconImageView.image = MenuIconImage;
    [cell addSubview:MenuIconImageView];
    
    MenuItemLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 200, 30)];
    MenuItemLabel.text = stringForCell;
    MenuItemLabel.font = [UIFont fontWithName:@"Calibri" size:18];
    MenuItemLabel.textColor = [UIColor colorWithRed:168.0f/255.0f green:175.0f/255.0f blue:181.0f/255.0f alpha:1.0f];
    
    [cell addSubview:MenuItemLabel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 4)
    {
        [self performSegueWithIdentifier:@"Stay Connected" sender:self];
    }
    else if(indexPath.row >=0 && indexPath.row <=3)
    {
        [self performSegueWithIdentifier:@"MemberResourcesSegue" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"Union News" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSIndexPath *indexPath = [menuItems indexPathForSelectedRow];
    NSString *theValue = [NSString stringWithFormat:@"%d",(int)(indexPath.row +1)];
    if(indexPath.row >=0 && indexPath.row <=3)
    {
        ExtendedTableView *e = segue.destinationViewController;
        e.index = [categories objectAtIndex:indexPath.row];
        e.title = [menuItemsArray objectAtIndex:indexPath.row];
        e.imageName = [MenuItemIcons objectAtIndex:indexPath.row];
    }
    if(indexPath.row >4)
    {
        UnionNews *news = segue.destinationViewController;
        news.category = [MenuItemIcons objectAtIndex:indexPath.row];
        news.title = [menuItemsArray objectAtIndex:indexPath.row];
        news.index = theValue;
    }
}

@end
