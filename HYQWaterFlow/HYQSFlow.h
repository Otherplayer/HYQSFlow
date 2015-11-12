//
//  HYQSFlow.h
//  HYQWaterFlow
//
//  Created by __无邪_ on 15/11/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGWaterFlowLayout.h"
@class    HYQSFlow;
@protocol HYQSFlowViewDelegate;
@protocol HYQSFlowViewDataSource;


/**
 *  瀑布流view
 */
@interface HYQSFlow : UIView

@property (nonatomic, weak) id<HYQSFlowViewDataSource> dataSource;
@property (nonatomic, weak) id<HYQSFlowViewDelegate>   delegate;


@property (nonatomic, assign) NSInteger    columnNum;   /***  列的数目，默认为4*/
@property (nonatomic, assign) CGFloat      itemSpacing; /***  cell的间距，默认为15*/
@property (nonatomic, assign) UIEdgeInsets contentInset;/***  内容缩进，默认为UIEdgeInsetsZero*/


- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (void)reloadData;/***  刷新数据*/

@end








////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
@protocol HYQSFlowViewDataSource <NSObject>
@required
- (NSInteger)sFlow:(HYQSFlow *)sFlow numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell *)sFlow:(HYQSFlow *)sFlow cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)sFlow:(HYQSFlow *)sFlow heightForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol HYQSFlowViewDelegate <NSObject>
@optional
- (void)sFlow:(HYQSFlow *)sFlow didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////



