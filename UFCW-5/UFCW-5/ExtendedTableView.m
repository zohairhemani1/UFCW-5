//
//  ExtendedTableView.m
//  UFCW 5
//
//  Created by Zohair Hemani on 16/02/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "ExtendedTableView.h"
#import "Constants.h"

@interface ExtendedTableView ()
{
    NSMutableArray *values;
    UIImage * MenuIconImage;
    UIImageView *MenuIconImageView;
    UILabel *MenuItemLabel;
    NSArray * MenuItemIcons;
}
@end

@implementation ExtendedTableView

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
    
    MenuItemIcons = [[NSArray alloc] initWithObjects:@"news",@"negotiation",@"member",@"member",@"connected",@"member",@"contact",@"union",@"events", nil];
    
    if([self.index isEqualToString:@"2"])
    {
        values = [[NSMutableArray alloc]initWithObjects:GetEducatedArray, nil];
    }
    else if ([self.index isEqualToString:@"3"])
    {
        values = [[NSMutableArray alloc]initWithObjects:MemberBenefitsArray, nil];
    }
    else
    {
        values = [[NSMutableArray alloc]initWithObjects:MemberResourcesArray, nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [values count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuIconImage = [UIImage imageNamed:[MenuItemIcons objectAtIndex:indexPath.row]];
    
    tableView.separatorColor = [UIColor colorWithRed:204.0f/255.0f green:208.0f/255.0f blue:211.0f/255.0f alpha:1.0f];
    
    
    UITableViewCell *cell;
    
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ExtendedCell" forIndexPath:indexPath];
    }
    
    MenuIconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 25, 25)];
    
    MenuIconImageView.image = MenuIconImage;
    [cell addSubview:MenuIconImageView];

    
    MenuItemLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 200, 30)];
    MenuItemLabel.text = [values objectAtIndex:indexPath.row];
    MenuItemLabel.font = [UIFont fontWithName:@"Calibri" size:18];
    MenuItemLabel.textColor = [UIColor colorWithRed:168.0f/255.0f green:175.0f/255.0f blue:181.0f/255.0f alpha:1.0f];
    
    [cell addSubview:MenuItemLabel];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[values objectAtIndex:indexPath.row] isEqualToString:@"Office Location"] )
    {
        [self performSegueWithIdentifier:@"officeSegue" sender:self];
    }
    else if ([[values objectAtIndex:indexPath.row] isEqualToString:@"Union Representatives"])
    {
        [self performSegueWithIdentifier:@"unionRepresentativesSegue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
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
