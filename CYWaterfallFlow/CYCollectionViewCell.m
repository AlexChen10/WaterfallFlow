//
//  CYCollectionViewCell.m
//  CYWaterfallFlow
//
//  Created by 陈玉 on 18/3/14.
//  Copyright © 2018年 陈玉. All rights reserved.
//

#import "CYCollectionViewCell.h"
#import "Header.h"

@implementation CYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {
        
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (CYScreenWidth-15)/2, CYScreenHeight/5+30)];
        _topImageView.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:_topImageView];
        
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CYScreenHeight/5+10, (CYScreenWidth-15)/2, 35)];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_nameLabel];
        
    }
    return self;
    
}

@end
