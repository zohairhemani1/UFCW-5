
//
//  UIViewController_StayConnected.h
//  UFCW 5
//
//  Created by Avialdo on 30/01/2015.
//  Copyright (c) 2015 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StayConnected : UIViewController<UITableViewDataSource,
UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *stay_connected;

@end
