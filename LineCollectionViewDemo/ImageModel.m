//
//  ImageModel.m
//  LineCollectionViewDemo
//
//  Created by qianfeng on 16/1/6.
//  Copyright (c) 2016年 lizhou. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

+(instancetype)imageModelWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}
-(instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+(NSArray *)imageModelReturnAllImageAndName
{
    //第一步就是直接加dic入array中;
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i =0; i<40; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        [dic setObject:[NSString stringWithFormat:@"%d.png",i] forKey:@"imageStr"];
        [dic setObject:[NSString stringWithFormat:@"图片%d",i] forKey:@"nameStr"];
        
        ImageModel *model = [ImageModel imageModelWithDic:dic];
        
        [arr addObject:model];
    }
    
    return arr;
}

@end
