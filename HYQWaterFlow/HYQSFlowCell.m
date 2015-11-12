//
//  HYQSFlowCell.m
//  HYQWaterFlow
//
//  Created by __无邪_ on 15/11/12.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "HYQSFlowCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation HYQSFlowCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

#pragma mark - Setter
- (void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    [self setNeedsLayout];
}


#pragma mark - configure
- (void)initSubviews{
    self.ivAvatar = [[UIImageView alloc] initWithFrame:self.bounds];
    self.ivAvatar.contentMode = UIViewContentModeScaleAspectFill;
    self.ivAvatar.image = [UIImage imageNamed:@"example.png"];
    self.clipsToBounds = YES;
    
    [self.contentView addSubview:self.ivAvatar];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.ivAvatar.frame = self.bounds;
    NSURL *url = [NSURL URLWithString:self.imageUrl];
    [self.ivAvatar sd_setImageWithURL:url placeholderImage:nil];
    
}
@end
