//
//  UnionNews.h
//  UFCW-5
//
//  Created by Zohair Hemani on 21/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnionNews : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *unionTable;
@property (weak,nonatomic) NSString *category;
@property (weak, nonatomic) NSString *index;

@end
