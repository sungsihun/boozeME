//
//  TableViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "NetworkManager.h"
#import "CollectionViewController.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray<UIImage*> *imageArray;
@property (nonatomic) NSArray<NSString*> *stringArray;
@property (nonatomic) NSString *urlString;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
    UIImage *image1 = [UIImage imageNamed:@"sunset.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"cheers.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"messy.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"party.jpg"];
    self.imageArray = [NSArray arrayWithObjects:image1, image2, image3, image4, nil];
  
    NSString *string1 = @"unwind";
    NSString *string2 = @"semi social";
    NSString *string3 = @"messy";
    NSString *string4 = @"rage";
    self.stringArray = [NSArray arrayWithObjects:string1, string2, string3, string4, nil];

  
}


#pragma mark - data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
  
  [cell setImageViewWithImage:self.imageArray[indexPath.row]];
  [cell setLabelWithString:self.stringArray[indexPath.row]];
  
  return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"collectionViewSegue"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    CollectionViewController *cvc = segue.destinationViewController;
    switch (indexPath.row) {
      case 0:
              cvc.url = [NSURL URLWithString:@"https://lcboapi.com/products?order=alcohol_content.desc&per_page=30&page=10&q=beer"];
        break;
      case 1:
              cvc.url = [NSURL URLWithString:@"https://lcboapi.com/products?order=alcohol_content.desc&per_page=30&page=10&q=wine"];
        break;
      case 2:
              cvc.url = [NSURL URLWithString:@"https://lcboapi.com/products?order=alcohol_content.desc&per_page=30&page=3"];
        break;
      case 3:
              cvc.url = [NSURL URLWithString:@"https://lcboapi.com/products?order=alcohol_content.desc&per_page=30&page=1"];
        break;
        
    }
  }
}




@end
