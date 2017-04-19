//
//  ImagePicker.m
//  NMImagePicker
//
//  Created by nayan on 08/03/17.
//  Copyright © 2017 Vishavatech. All rights reserved.
//

#import "ImagePicker.h"
#import "NMImageCell.h"
#import "NMImageObj.h"
#import "ImageUploader.h"

@interface ImagePicker ()

@end

@implementation ImagePicker{
    NSArray *images ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    BUKImagePickerController *imagePickerController = [[BUKImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.mediaType = BUKImagePickerControllerMediaTypeImage;
    imagePickerController.sourceType = BUKImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePickerController.allowsMultipleSelection = YES;
    imagePickerController.showsCameraCell = YES;
    imagePickerController.reversesAssets = YES;
    imagePickerController.usesScaledImage = YES;
    imagePickerController.numberOfColumnsInLandscape = 3;
    imagePickerController.numberOfColumnsInPortrait = 3;
    imagePickerController.maximumNumberOfSelection = 5 ;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)buk_imagePickerController:(BUKImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets {
    // Process assets
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (ALAsset *ass in assets){
        NMImageObj *obj = [[NMImageObj alloc] init];
        obj.image = [ass defaultRepresentation].url.absoluteString;
        obj.imagePathAssert = [ass defaultRepresentation].url;
        [temp addObject:obj];
    }
    images = temp;
    [self.collection_view reloadData];
    [self.collection_view selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    
    if (assets.count>0) {
        self.Image.image = [UIImage imageWithCGImage:[(ALAsset *) [assets objectAtIndex:0]defaultRepresentation].fullResolutionImage];
    }
    
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)upload_click:(id)sender
{
    NSLog(@"This is upload click..");
    for (int i=0; i<images.count; i++) {
        [[ImageUploader sharedInstance] AddToQue:[images objectAtIndex:i] EventId:@"123456789"];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return images.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NMImageCell *cell = (NMImageCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"picked_image" forIndexPath:indexPath];
    [cell setData:[images objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (images.count>= indexPath.row) {
        NMImageObj *data = [images objectAtIndex:indexPath.row];
        self.image_title.text = data.message;
        ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
        [assetslibrary assetForURL:[NSURL URLWithString:data.image] resultBlock:^(ALAsset *asset) {
            self.Image.image = [UIImage imageWithCGImage:[asset defaultRepresentation].fullResolutionImage];
        } failureBlock:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        self.image_title.text = data.message;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath
                     animated:(BOOL)animated
               scrollPosition:(UICollectionViewScrollPosition)scrollPosition{
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.image_title resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSArray *selectedIndexPaths = [self.collection_view indexPathsForSelectedItems];
    if (selectedIndexPaths.count > 0) {
        NSIndexPath *path =  selectedIndexPaths.firstObject;
        NMImageObj *data = [images objectAtIndex:path.row];
        data.message = textField.text;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.image_title endEditing:YES];
}

@end
