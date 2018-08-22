//
//  TableViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
  
  
  return cell;
}


@end
