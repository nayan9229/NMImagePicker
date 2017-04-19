//
//  ImagePicker.h
//  NMImagePicker
//
//  Created by nayan on 08/03/17.
//  Copyright © 2017 Vishavatech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <BUKImagePickerController/BUKImagePickerController.h>

@interface ImagePicker : UIViewController <BUKImagePickerControllerDelegate, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UITextField *image_title;
@property (weak, nonatomic) IBOutlet UICollectionView *collection_view;
@property (weak, nonatomic) IBOutlet UIButton *upload_btn;
- (IBAction)upload_click:(id)sender;

@end
