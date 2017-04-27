//
//  SquareCollectionViewCell.m
//  s
//
//  Created by wendy on 15/6/25.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "SquareCollectionViewCell.h"

@implementation SquareCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        _iconImageView = [[UIImageView alloc] initWithFrame:YZKRectMake(0, 0, 33, 33)];
        [self.contentView addSubview:_iconImageView];

        _titleLabel               = [[UILabel alloc] init];
        _titleLabel.font          = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    _iconImageView.centerX = self.boundsCenter.x;
    _iconImageView.y = YZKCalculateY(15);

    _titleLabel.frame = CGRectMake(0, _iconImageView.bottom + 10, self.width, 30);
}

@end
