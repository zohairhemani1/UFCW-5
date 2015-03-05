//
//  Map.m
//  Panic AAlaram Application
//
//  Created by Zainu Corporation on 17/05/2014.
//  Copyright (c) 2014 Zohair Hemani - Stanford Assignment. All rights reserved.
//


#import "Map.h"
#import <CoreLocation/CoreLocation.h>
#import "checkInternet.h"
#define METERS_PER_MILE 1609.344


@interface Map (){
    checkInternet *c;
    
    UIImage *img;
    NSString *profilePic ;
    NSString *imagePathString ;
    NSURL *imagePathUrl;
    NSData *data ;
}

@end

@implementation Map

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
	// Do any additional setup after loading the view.
    
    c = [[checkInternet alloc]init];
    [c viewWillAppear:YES];
    
    CLLocationCoordinate2D coordinates = [self getLocationFromAddressString:self.address];
    NSLog(@"the address is %@",self.address);
    NSLog(@"the latitude is: %f",coordinates.latitude);
    NSLog(@"the longitude is: %f",coordinates.longitude);
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(coordinates.latitude, coordinates.longitude);
    point.title = self.office_name;
    
    [self.mapView addAnnotation:point];
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinates, 0.25*METERS_PER_MILE, 0.25*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
        
}
-(void)viewDidDisappear:(BOOL)animated{
    [self viewWillDisappear:YES];
}

-(CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr {
    
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    return center;
    
}

@end

