//
//  ViewController.m
//  HYQWaterFlow
//
//  Created by __无邪_ on 15/11/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "HYQSFlow.h"
#import "HYQSFlowCell.h"

static NSString *IdentifierFlowCell = @"IdentifierFlowCell";

@interface ViewController ()<HYQSFlowViewDelegate,HYQSFlowViewDataSource>
@property (nonatomic, strong)HYQSFlow *flowView;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property (nonatomic, strong)NSMutableDictionary *dataSourceHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self buildDataThen:^{
        [self.flowView reloadData];
    }];
    
    
}

- (void)buildDataThen:(void (^)(void))then {
    // Simulate an async request
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Data from ``
        self.dataSource = [[NSMutableArray alloc] init];
        self.dataSourceHeight = [[NSMutableDictionary alloc] init];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pic_url.plist" ofType:nil];
        NSArray *dataArr = [NSArray arrayWithContentsOfFile:filePath];
        
        for (int i = 0; i < 20; i++) {
            [self.dataSource addObjectsFromArray:dataArr];
        }
        
        // Callback
        dispatch_async(dispatch_get_main_queue(), ^{
            !then ?: then();
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HYQSFlowViewDelegate
- (void)sflow:(HYQSFlow *)sflow didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - HYQSFlowViewDataSource
- (NSInteger)sFlow:(HYQSFlow *)sFlow numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)sFlow:(HYQSFlow *)sFlow cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYQSFlowCell *cell = [sFlow dequeueReusableCellWithReuseIdentifier:IdentifierFlowCell forIndexPath:indexPath];
    NSString *imageUrl = self.dataSource[indexPath.row];
    [cell setImageUrl:imageUrl];
    [cell setNeedsLayout];
    return cell;
}
- (CGFloat)sFlow:(HYQSFlow *)sFlow heightForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSNumber *heightNumber = self.dataSourceHeight[indexPath];
    if (heightNumber) {
        NSLog(@"Hit Cache");
        return heightNumber.floatValue;
    }
    
    NSArray *heightArr = @[@(100),@(200),@(400),@(50)];
    CGFloat height = [heightArr[indexPath.row % 3] floatValue];
    
    self.dataSourceHeight[indexPath] = @(height);
    
    return height;
}

#pragma mark - configure

- (HYQSFlow *)flowView{
    if (!_flowView) {
        _flowView = [[HYQSFlow alloc] initWithFrame:self.view.bounds];
        _flowView.delegate = self;
        _flowView.dataSource = self;
        _flowView.columnNum = 2;
        _flowView.itemSpacing = 10;
        _flowView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        [_flowView registerClass:[HYQSFlowCell class] forCellWithReuseIdentifier:IdentifierFlowCell];
        [self.view addSubview:_flowView];
        
    }
    return _flowView;
}




@end
