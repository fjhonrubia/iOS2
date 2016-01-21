//
//  FHLPhotoViewController.m
//  HackerBook2
//
//  Created by javi on 19/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "FHLPhotoViewController.h"
#import "FHLAnnotationImage.h"
#import "UIImage+Resize.h"
@import CoreImage;

@interface FHLPhotoViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) FHLAnnotationImage *model;
@end

@implementation FHLPhotoViewController

-(id)initWithModel:(id)model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    return self;
}

#pragma mark - View Lifecicle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.photoView.image = self.model.img;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.model.img = self.photoView.image;
}

- (IBAction)takePicture:(id)sender {
    
    // Crear uipicker
    UIImagePickerController *picker = [UIImagePickerController new];
    
    // configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    
    // mostrar
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         //
                     }];
    
    
}

- (IBAction)deletePhoto:(id)sender {
    
    
    // Estado inicial
    CGRect oldBounds = self.photoView.bounds;
    
    // Eliminarla de la vista
    [UIView animateWithDuration:0.6
                          delay:0
                        options:0
                     animations:^{
                         
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_2_PI);
                         
                     } completion:^(BOOL finished) {
                         self.photoView.image = nil;
                         self.photoView.alpha = 1;
                         self.photoView.bounds = oldBounds;
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
    
    // eliminarla del modelo
    self.model.img = nil;

}

#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    __block UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize screenSize = CGSizeMake(screenBounds.size.width * screenScale, screenBounds.size.height * screenScale);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        img = [img resizedImage:screenSize interpolationQuality:kCGInterpolationMedium];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.photoView.image = img;
            self.model.img = img;
            
        });
    });
    
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
    
}

@end
