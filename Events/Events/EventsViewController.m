//
//  EventsViewController.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()


@property(nonatomic,strong) IBOutlet NSMutableArray *eventsArray;
@property(nonatomic,strong) IBOutlet UITableView *tableView;
@property(nonatomic,strong) IBOutlet UILabel *headerSectionLabel;
@end


static NSString *EventCellIdentifier = @"EventCellID";

@implementation EventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _headerSectionLabel.text = @"10 events of 3000";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;//[_eventsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:EventCellIdentifier];
//    EventCategory *category = [_categoriesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = _categoryName;
    
    return cell;
}

@end
