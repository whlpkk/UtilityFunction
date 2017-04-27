//
//  WaterFallViewController.m
//  s
//
//  Created by wendy on 15/6/24.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "WaterFallViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "SquareCollectionViewCell.h"

@interface WaterFallViewController ()<CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource>
{
    CHTCollectionViewWaterfallLayout *_layout;
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
}

@end

@implementation WaterFallViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupCollectionView];
    [self setupData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupCollectionView
{
    _layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    _layout.columnCount             = 2;
    _layout.minimumInteritemSpacing = 10;
    _layout.minimumColumnSpacing    = 5;
    _layout.sectionInset            = kCommonMenuSquareCellSectionInset;

    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT - APP_NAVI_HEIGHT)
                                         collectionViewLayout:_layout];
    _collectionView.delegate   = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_collectionView];

    [_collectionView registerClass:[SquareCollectionViewCell class]
        forCellWithReuseIdentifier:kCommonMenuSquareCellIdentifier];
}

- (void)setupData
{
    //设置数据源
    [_collectionView reloadData];
}

#pragma mark - UICollectionView delegate & dataSource

- (CGSize)  collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
    sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(YZKCalculateX(159.5), YZKCalculateY(arc4random()%100+50));
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 8;// _dataArray.count
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SquareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCommonMenuSquareCellIdentifier forIndexPath:indexPath];

    [cell.iconImageView setImage:[UIImage imageNamed:@"icon_choiceLife_DesignatedService"]];


    cell.titleLabel.text = @"标题";

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
