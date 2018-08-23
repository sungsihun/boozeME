//
//  CollectionViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "NetworkManager.h"
#import "Booze.h"
#import "DetailViewController.h"

@interface CollectionViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray<Booze*> *objects;
@property (nonatomic) NSMutableArray<Booze*> *unwindArray;
@property (nonatomic) NSMutableArray<Booze*> *rageArray;
@property (nonatomic) NSMutableArray<Booze*> *semiSocialArray;
@property (nonatomic) NSMutableArray<Booze*> *messyArray;

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSLog(@"Getting Booze");
  
  self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  
  self.activityIndicator.center = self.view.center;
  
  [self.view addSubview:self.activityIndicator];
  
  [self.activityIndicator startAnimating];

  [NetworkManager getInfo:self.url with:^(NSMutableArray *boozes) {
    self.objects = boozes;
//  NSLog(@"View controller got data: %@", self.objects);
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.collectionView reloadData];
    }];
  }];
  
  
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"detailViewSegue"]) {
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    Booze *booze = self.objects[indexPath.item];
    
    DetailViewController *dvc = segue.destinationViewController;
    dvc.booze = booze;
  }
}




#pragma mark - data source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.objects.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
  
  [cell setImage: self.objects[indexPath.row]];
  
  [self.activityIndicator stopAnimating];
  
  return cell;
}



@end
