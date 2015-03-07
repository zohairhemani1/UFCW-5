//
//  Office Locations.h
//  UFCW 5
//
//  Created by Avialdo on 06/11/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfficeLocations : UIViewController<UITableViewDataSource,
UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *office;
@property (weak, nonatomic) NSString *CategoryIndex;

@end
