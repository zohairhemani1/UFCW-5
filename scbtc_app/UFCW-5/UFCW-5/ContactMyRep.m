//
//  StayConnected.m
//  UFCW 5
//
//  Created by Avialdo on 26/11/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "ContactMyRep.h"
#import "WebService.h"
#import "checkInternet.h"
#import "Constants.h"

@interface ContactMyRep (){
    NSArray *stayConnectedArray;
    checkInternet *checkInternetObj;
    UIActivityIndicatorView *loader;
    UILabel * name;
    UILabel * designation;
    UILabel * address;
    UIButton * phoneNumberOne;
    UIButton * phoneNumberTwo;
    UIButton * faxNumber;
    UIButton * email;
    NSMutableArray *categories;
    NSMutableAttributedString *commentString;
}

@end

@implementation ContactMyRep

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
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    checkInternetObj = [[checkInternet alloc] init];
    [checkInternetObj viewWillAppear:YES];
    
    loader = [checkInternetObj indicatorprogress:loader];
    [self.view addSubview:loader];
    [loader bringSubviewToFront:self.view];
    
    categories = [[NSMutableArray alloc]initWithObjects:CategoriesArray, nil];
    
    NSString *path = [[[[BaseURL stringByAppendingString:EXTENDED_DETAILED_URL]stringByAppendingString:[categories objectAtIndex:4]]stringByAppendingString:@"&app_id="]stringByAppendingString:APP_ID];
    
    dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
    dispatch_async(myqueue, ^(void) {
        
        [loader startAnimating];
        if([checkInternetObj internetstatus] == TRUE){
            WebService *stayConnectedRest = [[WebService alloc] init];
            stayConnectedArray = [[NSArray alloc] initWithArray:[stayConnectedRest FilePath:path parameterOne:nil]];
        }
        //NSString *subString = [@"" substringToIndex:rangeOfYourString.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update UI on main queue
            
            [self->stayConnected reloadData];
            [loader stopAnimating];
        });
        
    });
    
//    NSString *phNo = @"+919876543210";
//    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
//    
//    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
//        [[UIApplication sharedApplication] openURL:phoneUrl];
//    } else
//    {
//        //calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//        //[calert show];
//    }


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
    return [stayConnectedArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Stay Connected";
    
    UITableViewCell *cell;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    name = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 15)];
    name.text = [[[[stayConnectedArray valueForKey:@"name"] objectAtIndex:indexPath.row]stringByAppendingString:@" - "]stringByAppendingString:[[stayConnectedArray valueForKey:@"designation"] objectAtIndex:indexPath.row]];
    name.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:16];
    
    [cell addSubview:name];
    
    
    address = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 300, 55)];
    address.text = [[stayConnectedArray valueForKey:@"address"] objectAtIndex:indexPath.row];
    address.numberOfLines = 3;
    address.font = [UIFont fontWithName:@"Calibri" size:16];
    [cell addSubview:address];
    
    
    phoneNumberOne = [[UIButton alloc] initWithFrame:CGRectMake(20, 90, 200, 15)];
   // [phoneNumberOne setTitle:[@"Cell: " stringByAppendingString:[[stayConnectedArray valueForKey:@"phone_no1"] objectAtIndex:indexPath.row]] forState:normal];
        [phoneNumberOne setTitleColor:[UIColor blackColor] forState:normal];
    phoneNumberOne.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    phoneNumberOne.titleLabel.font= [UIFont fontWithName:@"Calibri" size:16];
    //[phoneNumberOne addGestureRecognizer:CallTapRecognizer];
    [phoneNumberOne addTarget:self action:@selector(callTap:) forControlEvents:UIControlEventTouchUpInside];
    [phoneNumberOne setTag:indexPath.row];
    
    commentString = [[NSMutableAttributedString alloc] initWithString:[@"Cell: " stringByAppendingString:[[stayConnectedArray valueForKey:@"phone_no1"] objectAtIndex:indexPath.row]]];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    [phoneNumberOne setAttributedTitle:commentString forState:normal];
    
    [cell addSubview:phoneNumberOne];

    email = [[UIButton alloc] initWithFrame:CGRectMake(20, 110, 200, 15)];
    //[email setTitle:[@"Email: " stringByAppendingString:[[stayConnectedArray valueForKey:@"email"] objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
    email.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [email setTitleColor:[UIColor blackColor] forState:normal];
    email.titleLabel.font = [UIFont fontWithName:@"Calibri" size:16];
    [email addTarget:self action:@selector(emailTap:) forControlEvents:UIControlEventTouchUpInside];
    [email setTag:indexPath.row];
    
    commentString = [[NSMutableAttributedString alloc] initWithString:[@"Email: " stringByAppendingString:[[stayConnectedArray valueForKey:@"email"] objectAtIndex:indexPath.row]]];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    [email setAttributedTitle:commentString forState:normal];
    //[email addGestureRecognizer:EmailTapRecognizer];
    [cell addSubview:email];
    
    faxNumber = [[UIButton alloc] initWithFrame:CGRectMake(20, 130, 200, 15)];
    [faxNumber setTitle:[@"Fax: " stringByAppendingString:[[stayConnectedArray valueForKey:@"fax_no"] objectAtIndex:indexPath.row]] forState:normal];
        [faxNumber setTitleColor:[UIColor blackColor] forState:normal];
    faxNumber.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    faxNumber.titleLabel.font= [UIFont fontWithName:@"Calibri" size:16];
    [cell addSubview:faxNumber];
    
    return cell;
}

-(void)emailTap :(id)sender{
    NSLog(@"tag number is = %ld",(long)[sender tag]);
    //NSLog(@"in email part");
    // Email Subject
    NSString *emailTitle = @"";
    // Email Content
    NSString *messageBody = @"";
    // To address
    NSString *email_recipent = [[stayConnectedArray valueForKey:@"email"] objectAtIndex:[sender tag]];
    NSArray *toRecipents = [NSArray arrayWithObject:email_recipent];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)callTap:(id)sender {
    
    NSString *call_reipent = [[stayConnectedArray valueForKey:@"phone_no1"] objectAtIndex:[sender tag]];
    
    call_reipent = [call_reipent stringByReplacingOccurrencesOfString:@"(" withString:@""];
    call_reipent = [call_reipent stringByReplacingOccurrencesOfString:@")" withString:@""];
    call_reipent = [call_reipent stringByReplacingOccurrencesOfString:@"-" withString:@""];
    call_reipent = [call_reipent stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    call_reipent = [@"telprompt://" stringByAppendingString:call_reipent];
    
    NSLog(@"call rep: %@", call_reipent);
    
    NSURL *url = [NSURL URLWithString:call_reipent];
    [[UIApplication  sharedApplication] openURL:url];
}
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
