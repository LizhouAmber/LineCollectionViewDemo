//
//  MyCell.m
//  LineCollectionViewDemo
//
//  Created by qianfeng on 16/1/6.
//  Copyright (c) 2016年 lizhou. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation MyCell

//-(instancetype)init
//{
//    if (self = [super init]) {
//        self.layer.cornerRadius = 6.0f;
//        self.layer.masksToBounds = YES;
//    }
//    return self;
//}

-(void)setModel:(ImageModel *)model
{
    _model = model;
    
    self.imageView.image = [UIImage imageNamed:model.imageStr];
    
    self.nameLabel.text = model.nameStr;
    
}

@end
