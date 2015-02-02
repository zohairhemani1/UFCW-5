//
//  WebService.m
//  Panic AAlaram Application
//
//  Created by Zohair Hemani on 04/05/2014.
//  Copyright (c) 2014 Zohair Hemani - Stanford Assignment. All rights reserved.
//

#import "WebService.h"
#import "checkInternet.h"

@implementation WebService{
    checkInternet *checkInternetObj;
    NSArray *jsonArray;
}


-(NSArray*)FilePath:(NSString*)filepath parameterOne:(NSString*)parameterOne parameterTwo:(NSString*)parameterTwo parameterThree:(NSString*)parameterThree
{
    checkInternetObj = [[checkInternet alloc] init];
    NSLog(@"out of condition %d",[checkInternetObj internetstatus]);
    
    if([checkInternetObj internetstatus] == TRUE){
        NSLog(@"in condition %d",[checkInternetObj internetstatus]);
    NSURL *jsonFileUrl = [NSURL URLWithString:filepath];
        NSLog(@"URL: %@", jsonFileUrl);
    
    // Create the NSURLConnection
    NSString * storedNumber = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    // Posting the values of edit text field to database to query the results.
    
    NSString *myRequestString = [NSString stringWithFormat:@"parameterOne=%@&parameterTwo=%@&parameterThree=%@&username=%@",parameterOne,parameterTwo,parameterThree,storedNumber];
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: jsonFileUrl];
    // set Request Type
    NSError *err = nil;
    [request setHTTPMethod: @"POST"];
    // Set content-type
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    // Set Request Body
    [request setHTTPBody: myRequestData];
    // Now send a request and get Response
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
   // NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData: returnData options: NSJSONReadingMutableContainers error: &err];
    
    //NSLog(@"%@",response);
    NSLog(@"JsonArray %@", jsonArray);
    }
    // return response;
    return jsonArray;
    
}

-(NSArray*)FilePath:(NSString*)filepath parameterOne:(NSString*)parameterOne
{
    NSArray * responseArray = [self FilePath:filepath parameterOne:parameterOne parameterTwo:nil parameterThree:nil];
    return responseArray;
}

-(NSArray*)FilePath:(NSString*)filepath parameterOne:(NSString*)parameterOne parameterTwo:(NSString*)parameterTwo
{
    NSArray * responseArray = [self FilePath:filepath parameterOne:parameterOne parameterTwo:parameterTwo parameterThree:nil];
    return responseArray;
}

@end
