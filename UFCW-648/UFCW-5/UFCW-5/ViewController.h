//
//  ViewController.h
//  UFCW-5
//
//  Created by Avialdo on 18/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *menuItems;
    NSMutableArray *menuItemsArray;
    __weak IBOutlet UIView *ImageView;

}
@property (weak, nonatomic) IBOutlet UIImageView *logo_image;
@end
