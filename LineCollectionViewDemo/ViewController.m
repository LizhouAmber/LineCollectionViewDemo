//
//  ViewController.m
//  LineCollectionViewDemo
//
//  Created by qianfeng on 16/1/6.
//  Copyright (c) 2016年 lizhou. All rights reserved.
//

#import "ViewController.h"

#import "LinnerFlowLayout.h"
#import "LinnerFlowLayout.h"
#import "ImageModel.h"
#import "MyCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) NSArray *cellInfoArray;

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.cellInfoArray = [ImageModel imageModelReturnAllImageAndName];
//    LinnerFlowLayout *linner = [[LinnerFlowLayout alloc]init];
    LinnerFlowLayout *second = [[LinnerFlowLayout alloc]init];
    self.myCollectionView.collectionViewLayout = second;
    
}

#pragma mark ------------ UICollectionViewDelegate

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellInfoArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [self.myCollectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];

    ImageModel *model = [self.cellInfoArray objectAtIndex:indexPath.row];
    
    cell.model = model;
    cell.layer.cornerRadius = 6.0f;
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, 140);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
