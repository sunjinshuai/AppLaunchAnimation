//
//  LaunchAnimationTool.m
//  AppLaunchScreenAnimation
//
//  Created by 孙金帅 on 16/5/30.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

#import "LaunchAnimationTool.h"

static NSInteger const imageViewsborderOffset = 150;
// 屏幕尺寸
#define FXScreenBounds [UIScreen mainScreen].bounds
#define FXScreenSize [UIScreen mainScreen].bounds.size
#define FXScreenWidth [UIScreen mainScreen].bounds.size.width
#define FXScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation LaunchAnimationTool

+ (void)showLaunchAnimationViewToWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIView *launchView = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:nil options:nil].firstObject;
    launchView.frame = FXScreenBounds;
    
    [window addSubview:launchView];
    UIImageView *backGroundImageView = [[UIImageView alloc] initWithFrame:FXScreenBounds];
    backGroundImageView.image = [UIImage imageNamed:@"fx_launchimage_bg"];
    
    backGroundImageView.frame = CGRectMake(-imageViewsborderOffset,0,FXScreenWidth + (imageViewsborderOffset),FXScreenHeight);
    
    backGroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    backGroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImage *iconImage = [UIImage imageNamed:@"fx_launchimage_front"];
    UIImageView *iconImageView = [[UIImageView alloc] initWithImage:iconImage];

    iconImageView.frame = FXScreenBounds;
    
    [launchView addSubview:backGroundImageView];
    [launchView addSubview:iconImageView];

    [UIView animateWithDuration:1.8f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveLinear animations:^{
        
        NSInteger randomTranslationValueX = imageViewsborderOffset - 100;
        NSInteger randomTranslationValueY = 0;
        
        CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(randomTranslationValueX, randomTranslationValueY);
        
        CGFloat randomScaleTransformValue = 1.0f;

        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(randomScaleTransformValue, randomScaleTransformValue);
        
        backGroundImageView.transform = CGAffineTransformConcat(scaleTransform, translationTransform);
        
    } completion:^(BOOL finished) {
        
        [launchView removeFromSuperview];

    }];
}

@end
