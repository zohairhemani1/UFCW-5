//
//  StayConnected.h
//  UFCW 5
//
//  Created by Avialdo on 26/11/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactMyRep : UIViewController<UITableViewDataSource,
UITableViewDelegate,MFMailComposeViewControllerDelegate,UIGestureRecognizerDelegate>{
    IBOutlet UITableView *stayConnected;
}

@property (weak, nonatomic) NSString *CategoryIndex;

@end
