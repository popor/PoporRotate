//
//  PoporRotate.m
//  PoporRotate
//
//  Created by popor on 2020/7/25.
//  Copyright © 2020 popor. All rights reserved.
//

#import "PoporRotate.h"

@implementation PoporRotate

+ (instancetype)share {
    static dispatch_once_t once;
    static PoporRotate * instance;
    dispatch_once(&once, ^{
        instance = [PoporRotate new];
        
        // vc nc
        instance.autorotate        = NO;
        instance.supportedInterfaceOrientations = UIInterfaceOrientationMaskPortrait;
        
        instance.vcAutorotate_moment = NO;
        instance.vcAutorotate_moment_delay = 0.1;
    });
    return instance;
}

- (void)setVcAutorotate_moment:(BOOL)autorotate_moment {
    if (autorotate_moment) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.vcAutorotate_moment_delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.vcAutorotate_moment = NO;
        });
    }
    _vcAutorotate_moment = autorotate_moment;
}

#pragma mark - VC 部分
- (void)orientationAll {
    self.autorotate = YES;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.supportedInterfaceOrientations = UIInterfaceOrientationMaskAll;
    } else {
        self.supportedInterfaceOrientations = UIInterfaceOrientationMaskAllButUpsideDown;
    }
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        if (success) {
            UIDeviceOrientation pmmDeviceOrientation = poporMotionManager.deviceOrientation;
            [UIDevice updateOrientation:pmmDeviceOrientation];
        } else {
            [UIDevice updateOrientation:UIDeviceOrientationPortrait];
        }
        [poporMotionManager stopMonitor];
    }];
}

- (void)orientationLeft {
    self.vcAutorotate_moment = YES;
    self.autorotate = NO;
    self.supportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeRight;
    [UIDevice updateOrientation:UIDeviceOrientationLandscapeLeft];
}

- (void)orientationRitht {
    self.vcAutorotate_moment = YES;
    self.autorotate = NO;
    self.supportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeLeft;
    [UIDevice updateOrientation:UIDeviceOrientationLandscapeRight];
}

- (void)orientationLandscape_priorityLeft:(BOOL)priorityLeft {
    // 这个左右是相反的
    UIDeviceOrientation priorityDeviceOrientation = !priorityLeft ? UIDeviceOrientationLandscapeLeft:UIDeviceOrientationLandscapeRight;
    
    self.autorotate = YES;
    self.supportedInterfaceOrientations = UIInterfaceOrientationMaskLandscape;
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        if (success) {
            UIDeviceOrientation pmmDeviceOrientation = poporMotionManager.deviceOrientation;
            if (pmmDeviceOrientation != UIDeviceOrientationLandscapeLeft
                && pmmDeviceOrientation != UIDeviceOrientationLandscapeRight) {
                [UIDevice updateOrientation:priorityDeviceOrientation];
            } else {
                [UIDevice updateOrientation:pmmDeviceOrientation];
            }
        } else {
            [UIDevice updateOrientation:priorityDeviceOrientation];
        }
        [poporMotionManager stopMonitor];
    }];
}

- (void)orientationUp {
    self.vcAutorotate_moment = YES;
    self.autorotate = NO;
    self.supportedInterfaceOrientations = UIInterfaceOrientationMaskPortrait;
    [UIDevice updateOrientation:UIDeviceOrientationPortrait];
}

- (void)orientationVertical_priorityUp:(BOOL)priorityUp {
    // 这个左右是相反的
    UIDeviceOrientation priorityDeviceOrientation = priorityUp ? UIDeviceOrientationPortrait:UIDeviceOrientationPortraitUpsideDown;
    
    self.autorotate = YES;
    self.supportedInterfaceOrientations = UIDeviceOrientationPortrait +UIDeviceOrientationPortraitUpsideDown;
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        if (success) {
            UIDeviceOrientation pmmDeviceOrientation = poporMotionManager.deviceOrientation;
            if (pmmDeviceOrientation != UIDeviceOrientationPortrait
                && pmmDeviceOrientation != UIDeviceOrientationPortraitUpsideDown) {
                [UIDevice updateOrientation:priorityDeviceOrientation];
            } else {
                [UIDevice updateOrientation:pmmDeviceOrientation];
            }
        } else {
            [UIDevice updateOrientation:priorityDeviceOrientation];
        }
        [poporMotionManager stopMonitor];
    }];
    
}


@end
