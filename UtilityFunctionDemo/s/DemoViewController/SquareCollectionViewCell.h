//
//  SquareCollectionViewCell.h
//  s
//
//  Created by wendy on 15/6/25.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCommonMenuSquareCellIdentifier    @"CommonMenuSquareCell"

#define kCommonMenuSquareCellSectionInset  UIEdgeInsetsMake(0, 0, 0, 0)
#define kCommonMenuSquareCellColumnSpacing 1
#define kCommonMenuSquareCellSize          CGSizeMake(YZKCalculateX(159.5), YZKCalculateY(100))

@interface SquareCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end
