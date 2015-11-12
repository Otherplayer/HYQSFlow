# HYQSFlow
=================================

A Simple WATER FLOW

![image](https://github.com/Otherplayer/HYQSFlow/raw/master/Others/screenshot.jpg)
## Usage ##

Import 
```objective-c
#import <HYQSFlow.h>
...
```

##Use it!
```objective-c

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


```



## [CocoaPods](http://cocoapods.org/)

Add HYQSFlow to your `Podfile` and `pod install`.

```ruby
pod 'HYQSFlow', '~> 0.0.4'
```

## License

These specifications and CocoaPods are available under the [MIT license](http://www.opensource.org/licenses/mit-license.php).








