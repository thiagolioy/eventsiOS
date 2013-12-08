//
//  EventsViewController.h
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSString *categoryName;
@end
