//
//  EventsViewController.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "EventsViewController.h"
#import "APIClient.h"
#import "Event.h"
#import "EventCell.h"

@interface EventsViewController (){
    NSUInteger pageNumber;
    NSUInteger pageSize;
}


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
    [self configureFetchEventsParams];
    [self loadEvents];
}

-(void)configureFetchEventsParams{
    pageNumber = 1;
    pageSize = 20;
}

-(void)updateHeaderSectionWithNumberOfEvents:(NSUInteger)eventsNumber andTotalEventsNumber:(NSUInteger)total{
    _headerSectionLabel.text = [NSString stringWithFormat:@"%d event(s) of %d",eventsNumber,total];
}



-(void)loadEvents{
    [[APIClient shareClient] fetchEventsForCategoryName:_categoryName withPageNumber:pageNumber andPageSize:pageSize onSuccess:^(NSArray *events,NSUInteger totalEventsCount) {
        if(!_eventsArray)
            _eventsArray = [NSMutableArray arrayWithCapacity:events.count];
        [_eventsArray addObjectsFromArray:events];
        [self updateHeaderSectionWithNumberOfEvents:_eventsArray.count andTotalEventsNumber:totalEventsCount];
        [_tableView reloadData];
        
    } onFailure:^{
       
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_eventsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EventCell *cell = (EventCell*)[_tableView dequeueReusableCellWithIdentifier:EventCellIdentifier];
    Event *event = [_eventsArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = event.title;
    cell.addressLabel.text = event.address;
    cell.descriptionTextView.text = event.description;
    
    return cell;
}

@end
