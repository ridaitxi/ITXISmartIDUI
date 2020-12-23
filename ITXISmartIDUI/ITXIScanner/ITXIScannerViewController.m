//
//  ITXIScannerViewController.m
//  RCTSmartIDReader
//
//  Created by Rida on 1/27/20.
//  Copyright © 2020 se. All rights reserved.
//

#import "ITXIScannerViewController.h"

@interface ITXIScannerViewController ()

@property UIDeviceOrientation currentOrientation;

@end

@implementation ITXIScannerViewController

- (id)init {
    return [super initWithNibName:@"ITXIScannerViewController" bundle:[NSBundle mainBundle]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateLayout];
}

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLayout) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    
    if (self.imageName != nil) {
        [self setImageName:self.imageName promptText:nil andCancelButtonText:nil];
    }
}

- (void)updateLayout {
    self.currentOrientation = [UIDevice currentDevice].orientation;
    
    if (self.currentOrientation == UIDeviceOrientationFaceUp || self.currentOrientation == UIDeviceOrientationFaceDown || self.currentOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [self rotate];
    } else {
        if (UIDeviceOrientationIsLandscape(self.currentOrientation)) {
            [self.portraitStackView setHidden:YES];
            [self.landscapeView setHidden:NO];
        } else if (UIDeviceOrientationIsPortrait(self.currentOrientation)){
            [self.portraitStackView setHidden:NO];
            [self.landscapeView setHidden:YES];
        }
    }
}

- (void)rotate
{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    [UIViewController attemptRotationToDeviceOrientation];
}

- (void)bringSubViewsToFront {
    [self.view bringSubviewToFront:self.portraitStackView];
    [self.view bringSubviewToFront:self.landscapeView];
}

- (void)setImageName:(NSString *)imageName promptText:(NSString *)promptText andCancelButtonText:(NSString *)cancelButtonText {
    if (imageName != nil) {
        UIImage *image = [UIImage imageNamed:imageName];
        [self.scanImageView setImage:image];
        [self.secondaryScanImageView setImage:image];
    }
    
    if (promptText != nil) {
        [self.promptLabel setText:promptText];
    }
    
    if (cancelButtonText != nil) {
        [self.dismissButton setTitle:cancelButtonText forState:UIControlStateNormal];
    }
}

@end
