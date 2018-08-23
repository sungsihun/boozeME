//
//  CollectionViewCell.h
//  boozeME
//
//  Created by NICE on 2018-08-22.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Booze;

@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic) Booze *booze;
- (void)setImage:(Booze *)booze;
@end
