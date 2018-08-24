//
//  FavouritesViewController.m
//  boozeME
//
//  Created by Kyla  on 2018-08-24.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "FavouritesViewController.h"
#import "FavouritesCell.h"
#import "Booze.h"

@interface FavouritesViewController ()<UITableViewDataSource>

@property (nonatomic) NSString *name;

@property (nonatomic) NSMutableArray *favesArray;
@property (weak, nonatomic) IBOutlet UITableView *faveTableView;


@end

@implementation FavouritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.favesArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"test3"] mutableCopy];
  

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.favesArray.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  FavouritesCell *favouritesCell = [tableView dequeueReusableCellWithIdentifier:@"faveCell" forIndexPath:indexPath];
  
  NSString *name = self.favesArray[indexPath.row];

  
  [favouritesCell configureFaveCell:name];
  return favouritesCell;
}




@end
