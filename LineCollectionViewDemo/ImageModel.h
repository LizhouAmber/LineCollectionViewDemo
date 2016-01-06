//
//  ImageModel.h
//  LineCollectionViewDemo
//
//  Created by qianfeng on 16/1/6.
//  Copyright (c) 2016年 lizhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property (nonatomic, strong) NSString *imageStr;

@property (nonatomic, strong) NSString *nameStr;

+(NSArray*)imageModelReturnAllImageAndName;

@end
