//
//  HYQSFlow.m
//  HYQWaterFlow
//
//  Created by __无邪_ on 15/11/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "HYQSFlow.h"


@interface HYQSFlow ()<BGWaterFlowLayoutDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) BGWaterFlowLayout *waterFlowLayout;
@end

@implementation HYQSFlow

#pragma mark - lifeCircle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}


////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Public

- (void)reloadData{
    [self.collectionView reloadData];
}

- (void)setColumnNum:(NSInteger)columnNum{
    _columnNum = columnNum;
    self.waterFlowLayout.columnNum = columnNum;
}

- (void)setItemSpacing:(CGFloat)itemSpacing{
    self.waterFlowLayout.itemSpacing = itemSpacing;
}

- (void)setContentInset:(UIEdgeInsets)contentInset{
    _contentInset = contentInset;
    self.waterFlowLayout.contentInset = contentInset;
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier{
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource sFlow:self numberOfItemsInSection:section];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self.dataSource sFlow:self cellForItemAtIndexPath:indexPath];
}

#pragma mark - BGWaterFlowLayoutDelegate method
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if([self.delegate respondsToSelector:@selector(sFlow:didSelectItemAtIndexPath:)]){
        [self.delegate sFlow:self didSelectItemAtIndexPath:indexPath];
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(BGWaterFlowLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self.dataSource sFlow:self heightForItemAtIndexPath:indexPath];
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - configure

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.waterFlowLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (BGWaterFlowLayout *)waterFlowLayout{
    if (!_waterFlowLayout) {
        _waterFlowLayout = [[BGWaterFlowLayout alloc] init];
        _waterFlowLayout.columnNum = 4;
        _waterFlowLayout.itemSpacing = 15;
        _waterFlowLayout.contentInset = UIEdgeInsetsZero;
    }
    return _waterFlowLayout;
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

@end
