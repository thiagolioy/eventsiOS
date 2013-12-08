//
//  CategoriesViewController.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "CategoriesViewController.h"
#import "APIClient.h"
#import "EventCategory.h"
#import "EventsViewController.h"

@interface CategoriesViewController ()

@property(nonatomic,strong) IBOutlet NSMutableArray *categoriesArray;
@property(nonatomic,strong) IBOutlet UITableView *tableView;

@end

static NSString *CategoryCellIdentifier = @"CategoryCellID";

@implementation CategoriesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadCategories];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadCategories{
    
    [[APIClient shareClient] fetchCategorieOnsuccess:^(NSArray *categories) {

        if(!_categoriesArray)
            _categoriesArray = [NSMutableArray arrayWithCapacity:categories.count];
        [_categoriesArray addObjectsFromArray:categories];
        [_tableView reloadData];

    } Onfailure:^(void) {
        
    }];
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_categoriesArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CategoryCellIdentifier];
    EventCategory *category = [_categoriesArray objectAtIndex:indexPath.row];
   
    cell.textLabel.text = category.name;
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"events"]){
        EventsViewController *events = (EventsViewController *)[segue destinationViewController];
        UITableViewCell *selectedCell = (UITableViewCell*)sender;
        events.categoryName = selectedCell.textLabel.text;
    }
}

@end
