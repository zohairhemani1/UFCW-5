//
//  ExtendedTableView.m
//  UFCW 5
//
//  Created by Zohair Hemani on 16/02/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import "ExtendedTableView.h"
#import "Constants.h"
#import "ExtendedWebView.h"

@interface ExtendedTableView ()
{
    NSMutableArray *values;
    UIImage * MenuIconImage;
    UIImageView *MenuIconImageView;
    UILabel *MenuItemLabel;
    int indexNumber;
    NSMutableArray *categories;
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
    categories = [[NSMutableArray alloc]initWithObjects:CategoriesArray, nil];
    indexNumber = [self.index intValue];
    
    if ([self.index isEqualToString:@"10"]) {
        values = [[NSMutableArray alloc]initWithObjects:Item1Array, nil];
    }
    else if([self.index isEqualToString:@"11"])
    {
        values = [[NSMutableArray alloc]initWithObjects:Item2Array, nil];
    }
    else if ([self.index isEqualToString:@"12"])
    {
        values = [[NSMutableArray alloc]initWithObjects:Item3Array, nil];
    }
    else
    {
        values = [[NSMutableArray alloc]initWithObjects:Item4Array, nil];
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
    MenuIconImage = [UIImage imageNamed:self.imageName];
    
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
    MenuItemLabel.font = [UIFont fontWithName:@"Calibri" size:17];
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
    else
    {
        [self performSegueWithIdentifier:@"webViewSegue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.extendedTableView indexPathForSelectedRow];
    
    if([segue.identifier isEqualToString:@"webViewSegue"])
    {
        ExtendedWebView *e = segue.destinationViewController;
        NSString *theValue = [NSString stringWithFormat:@"%d.%d",indexNumber,(int)(indexPath.row +1)];
        e.CategoryIndex = theValue;
        e.title = [values objectAtIndex:indexPath.row];
    }
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
