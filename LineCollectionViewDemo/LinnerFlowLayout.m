//
//  SecondFlowLayout.m
//  LineCollectionViewDemo
//
//  Created by qianfeng on 16/1/6.
//  Copyright (c) 2016年 lizhou. All rights reserved.
//

#import "LinnerFlowLayout.h"

@implementation LinnerFlowLayout

//第一步,既然是保持最中央的在屏幕的最中间,采用的方法如下,这个方法官方解释为:设置一个断点,到这个点的时候停止.系统默认的是最左边,所以现在的工作是把停止的断点设为中央值.

-(instancetype)init
{
    if (self = [super init]) {
        
        self.minimumLineSpacing = 30;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //1.第一步,得到当前窗口的中间值
    CGFloat horizetParam = proposedContentOffset.x + CGRectGetWidth(self.collectionView.frame)/2.0;
    
    //2.第二步,把当前窗口中最偏向中央的元素找到.
    CGFloat itemParam = MAXFLOAT;
    
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.frame.size.height);
    
    NSArray *array = [super layoutAttributesForElementsInRect:visibleRect];
    
    for (UICollectionViewLayoutAttributes *attribute in array) {
        CGFloat itemHorizetParam = attribute.center.x;
        if (ABS(itemHorizetParam - horizetParam) < ABS(itemParam)) {
            itemParam = itemHorizetParam - horizetParam;
        }
        
    }
    return CGPointMake(proposedContentOffset.x + itemParam, proposedContentOffset.y);
}

static CGFloat const ScaleParam = 0.2;
static CGFloat const ItemParam = 60;

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.frame.size;
    
    //要找到中央的那个元素,并且放大
    for (UICollectionViewLayoutAttributes *attribute in array) {
        if (CGRectIntersectsRect(rect, attribute.frame)) {
            CGFloat itemiParam = CGRectGetMidX(visibleRect) - attribute.center.x;
            CGFloat itemChaParam = itemiParam / ItemParam;
            if (ABS(itemiParam) < ItemParam) {
                NSLog(@"itemChaParam :::%f",itemChaParam);
                CGFloat itemFloat = 1 + ScaleParam*(1-ABS(itemChaParam));
                NSLog(@"%f",itemiParam/itemiParam);
                attribute.transform3D = CATransform3DMakeScale(itemFloat, itemFloat, 1.0);
                attribute.zIndex = 1;
            }
        }
    }
    return array;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
