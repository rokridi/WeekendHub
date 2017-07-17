//
//  HotelsViewController.m
//  WeekendHub
//
//  Created by Rokridi on 15/07/2017.
//  Copyright © 2017 Rokridi. All rights reserved.
//

#import "HotelsViewController.h"
#import "WeekendViewController.h"
#import "WeekendsHTTPSessionManager.h"
#import "HotelsSearch.h"
#import "Hotel.h"
#import "WeekendTableViewCell.h"

static NSUInteger const PageSize = 15;
static NSString * const Locale = @"fr_FR";

@interface HotelsViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *hotels;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

//Represents the current executing HTTP request.
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation HotelsViewController

- (void)weekendsWithLimit:(NSUInteger)limit page:(NSUInteger)page success:(void (^)(HotelsSearch *result))success failure:(void (^)(NSError * error))failure {

    self.dataTask = [[WeekendsHTTPSessionManager sharedInstance] weekendsForLocale:Locale orderedBy:OrderByPriceQuality limit:limit page:page success:success failure:failure];
}

- (void)searchHotels {
    
    [self.refreshControl beginRefreshing];
    
    //If there is a current HTTP request then cancel it.
    if (self.dataTask != nil )
    {
        [self.dataTask cancel];
        self.dataTask = nil;
    }
    
    //Launch the HTTP request to get the list of hotels.
    [[WeekendsHTTPSessionManager sharedInstance] weekendsForLocale:@"fr_FR" orderedBy:OrderByPriceQuality limit:PageSize page:0 success:^(HotelsSearch *result) {
        
        [self.hotels removeAllObjects];
        
        [self.hotels addObjectsFromArray:result.hotels];
        
        [self.tableView reloadData];
        
        [self.refreshControl endRefreshing];
        
    } failure:^(NSError *error) {
        
        [self.refreshControl endRefreshing];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error !" message:error.description delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alertView show];
    }];
}

- (void)configureTableView {

    self.tableView.estimatedRowHeight = 80.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedSectionHeaderHeight = 25;
}

- (void)configureRefreshControl {

    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor lightGrayColor];
    [self.refreshControl addTarget:self action:@selector(searchHotels) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:self.refreshControl];
}

#pragma mark - UIViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.hotels = [[NSMutableArray alloc] init];
    
    [self configureTableView];
    [self configureRefreshControl];
    
    [self searchHotels];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    WeekendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WeekendTableViewCellIdentifier];
    
    Hotel *hotel = self.hotels[indexPath.section];
    Weekend *weekend = hotel.weekend[indexPath.row];
    
    cell.weekend = weekend;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.hotels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    Hotel *hotel = self.hotels[section];
    
    return hotel.weekend.count;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    Hotel *hotel = self.hotels[section];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.text = [NSString stringWithFormat:@"%@, %@ \n %.1f/10", hotel.label, hotel.address, hotel.average];
    
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Hotel *hotel = self.hotels[indexPath.section];
    
    WeekendViewController *weekendVC = (WeekendViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"WeekendViewController"];
    weekendVC.weekend = hotel.weekend[indexPath.row];
    
    [self.navigationController pushViewController:weekendVC animated:YES];
}

@end
