//
//  FavouritesCell.m
//  boozeME
//
//  Created by Kyla  on 2018-08-24.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "FavouritesCell.h"

@interface FavouritesCell ()

@property (weak, nonatomic) IBOutlet UILabel *faveLabel;


@end

@implementation FavouritesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

-(void)configureFaveCell:(NSString *)name {
  self.faveLabel.text = name;

}

@end
