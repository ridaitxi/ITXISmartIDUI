//
//  ITXIScannerViewController.h
//  RCTSmartIDReader
//
//  Created by Rida on 1/27/20.
//  Copyright © 2020 se. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITXIScannerViewController : UIViewController

// Properties
@property NSString *imageName;
@property (weak, nonatomic) IBOutlet UIImageView *scanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondaryScanImageView;
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@property (weak, nonatomic) IBOutlet UIStackView *portraitStackView;
@property (weak, nonatomic) IBOutlet UIView *landscapeView;

- (void)bringSubViewsToFront;
- (void)setImageName:(NSString *)imageName promptText:(NSString *)promptText andCancelButtonText:(NSString *)cancelButtonText;

@end
