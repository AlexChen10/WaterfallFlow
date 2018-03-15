//
//  ViewController.m
//  CYWaterfallFlow
//
//  Created by 陈玉 on 18/3/14.
//  Copyright © 2018年 陈玉. All rights reserved.
//

#import "ViewController.h"
#import "CYCollectionViewCell.h"
#import "Header.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    UICollectionView *_collectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self layoutSubViews];
}

- (void)layoutSubViews {

    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewFlowLayout];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_collectionView];
    
    // 注册类，是用纯代码生成的collectiviewcell类才行
    [_collectionView registerClass:[CYCollectionViewCell class] forCellWithReuseIdentifier:@"CYCollectionViewCellId"];

}

#pragma mark - UICollectionViewDataSourceDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CYCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CYCollectionViewCellId" forIndexPath:indexPath];
    
    collectionViewCell.topImageView.image = [UIImage imageNamed:@" "];

    collectionViewCell.nameLabel.text = [NSString stringWithFormat:@"name%ld",indexPath.item];
    collectionViewCell.backgroundColor = [UIColor whiteColor];
    
    CGFloat cellWidth = (CYScreenWidth-15)/2;
    CGFloat cellHeight = CYScreenHeight/5+45;
    
    if (indexPath.item%2 == 0) {
        
        collectionViewCell.frame = CGRectMake(5, (cellHeight+2.5)*(indexPath.item/2)+cellHeight/2, cellWidth, cellHeight);
        
    }else {
        
        collectionViewCell.frame = CGRectMake(cellWidth+10, (cellHeight+2.5)*((indexPath.item-1)/2), cellWidth, cellHeight);
        
    }
    
    return collectionViewCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击第几行===%ld",indexPath.item);
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((CYScreenWidth-15)/2, CYScreenHeight/5+45);
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

// 设置section头视图的参考大小，与tableheaderview类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.frame.size.width, 40);
}

// 设置section尾视图的参考大小，与tablefooterview类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(self.view.frame.size.width, 40);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
