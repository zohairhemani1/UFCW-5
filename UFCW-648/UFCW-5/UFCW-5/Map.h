//
//  Map.h
//  Panic AAlaram Application
//
//  Created by Zainu Corporation on 17/05/2014.
//  Copyright (c) 2014 Zohair Hemani - Stanford Assignment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Map : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

@property(strong,nonatomic) CLLocationManager * locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak,nonatomic) NSString *address;
@property (weak,nonatomic) NSString *office_name;

@end
