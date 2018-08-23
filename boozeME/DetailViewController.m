//
//  DetailViewController.m
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "DetailViewController.h"
#import "Booze.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *servingLabel;
@property (weak, nonatomic) IBOutlet UILabel *tastingLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.imageView.image = self.booze.image;
  
  self.nameLabel.text = self.booze.name;
  self.nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.nameLabel.numberOfLines = 0;
  
  self.priceLabel.text = [NSString stringWithFormat:@"$%.02f", self.booze.price.floatValue/100];
  
  self.servingLabel.text = self.booze.servingSuggestion;
  self.servingLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.servingLabel.numberOfLines = 0;
  
  self.tastingLabel.text = self.booze.tastingNote;
  self.tastingLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.tastingLabel.numberOfLines = 0;
  
  self.styleLabel.text = self.booze.style;
  self.styleLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.styleLabel.numberOfLines = 0;
}


@end
