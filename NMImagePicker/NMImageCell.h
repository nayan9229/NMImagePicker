//
//  NMImageCell.h
//  NMImagePicker
//
//  Created by nayan on 08/03/17.
//  Copyright © 2017 Vishavatech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "NMImageObj.h"

@interface NMImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;

-(void) setData:(NMImageObj *) data;

@end
