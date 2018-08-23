//
//  DetailViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "DetailViewController.h"
#import "Booze.h"

@interface DetailViewController () <UIScrollViewDelegate>
@property (nonatomic)  UILabel *nameLabel;
@property (nonatomic)  UIImageView *imageView;
@property (nonatomic)  UILabel *priceLabel;
@property (nonatomic)  UILabel *servingLabel;
@property (nonatomic)  UILabel *tastingLabel;
@property (nonatomic)  UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.scrollView.delegate = self;
  
  // name label
  self.nameLabel = [[UILabel alloc] init];
  self.nameLabel.text = self.booze.name;
  self.nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.nameLabel.numberOfLines = 0;
  self.nameLabel.backgroundColor = UIColor.whiteColor;
  [self.scrollView addSubview:self.nameLabel];
  
  self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.nameLabel.topAnchor
   constraintEqualToAnchor:self.scrollView.topAnchor constant:30].active = YES;
  [self.nameLabel.centerXAnchor
   constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
  [self.nameLabel.widthAnchor
   constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
  
  
  
  // image view
  self.imageView = [[UIImageView alloc] initWithImage:self.booze.image];
  self.imageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.scrollView addSubview:self.imageView];
  
  self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.imageView.centerXAnchor
   constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
  [self.imageView.topAnchor
   constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:50].active = YES;
  
  [self.imageView.widthAnchor constraintEqualToConstant:240].active = YES;
  [self.imageView.heightAnchor constraintEqualToConstant:280].active = YES;
  
  
  
  
  // price label
  self.priceLabel = [[UILabel alloc] init];
  self.priceLabel.text = [NSString stringWithFormat:@"$%.02f", self.booze.price.floatValue/100];
  self.priceLabel.backgroundColor = UIColor.whiteColor;
  self.priceLabel.textAlignment = NSTextAlignmentCenter;
  [self.scrollView addSubview:self.priceLabel];
  
  self.priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.priceLabel.centerXAnchor
   constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
  [self.priceLabel.topAnchor
   constraintEqualToAnchor:self.imageView.bottomAnchor constant:10].active = YES;
  [self.priceLabel.widthAnchor
   constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;

  
  
  
  // serving label
  self.servingLabel = [[UILabel alloc] init];
  self.servingLabel.text = self.booze.servingSuggestion;
  self.servingLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.servingLabel.numberOfLines = 0;
  self.servingLabel.backgroundColor = UIColor.whiteColor;
  [self.scrollView addSubview:self.servingLabel];
  
  self.servingLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  self.servingLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.servingLabel.centerXAnchor
   constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
  [self.servingLabel.topAnchor
   constraintEqualToAnchor:self.priceLabel.bottomAnchor constant:50].active = YES;
  [self.servingLabel.widthAnchor
   constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;

  
  
  
  // testing label
  self.tastingLabel = [[UILabel alloc] init];
  self.tastingLabel.text = self.booze.tastingNote;
  self.tastingLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.tastingLabel.numberOfLines = 0;
  self.tastingLabel.backgroundColor = UIColor.whiteColor;
  [self.scrollView addSubview:self.tastingLabel];
  
  self.tastingLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  self.tastingLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.tastingLabel.centerXAnchor
   constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
  [self.tastingLabel.topAnchor
   constraintEqualToAnchor:self.servingLabel.bottomAnchor constant:10].active = YES;
  [self.tastingLabel.widthAnchor
   constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;

  
  
  // style label
  self.styleLabel = [[UILabel alloc] init];
  self.styleLabel.text = self.booze.style;
  self.styleLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.styleLabel.numberOfLines = 0;
  self.styleLabel.backgroundColor = UIColor.whiteColor;
  [self.scrollView addSubview:self.styleLabel];
  
  self.styleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  self.styleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.styleLabel.centerXAnchor
   constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
  [self.styleLabel.topAnchor
   constraintEqualToAnchor:self.tastingLabel.bottomAnchor constant:10].active = YES;
  [self.styleLabel.widthAnchor
   constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
}


@end
