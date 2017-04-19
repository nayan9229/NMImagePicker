//
//  NMImageCell.m
//  NMImagePicker
//
//  Created by nayan on 08/03/17.
//  Copyright © 2017 Vishavatech. All rights reserved.
//

#import "NMImageCell.h"

@implementation NMImageCell{
    NMImageObj *mData ;
}


-(void) setData:(NMImageObj *) data{
    mData = data;
//    NSLog(@"1 : %@", data);
//    NSLog(@"2 : %@", data.image);
//    NSLog(@"3 : %@", data.imagePathAssert);
//    NSLog(@"4 : %@", [NSURL URLWithString:[NSString stringWithFormat:@"%@", data.image]]);
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:[NSURL URLWithString:data.image] resultBlock:^(ALAsset *asset) {
        self.image.image = [UIImage imageWithCGImage:[asset thumbnail]];
    } failureBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
}

@end
