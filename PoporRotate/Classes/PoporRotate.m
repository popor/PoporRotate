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
        instance.vcAutorotate        = NO;
        instance.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskPortrait;
        
        instance.vcAutorotate_moment = NO;
        instance.vcAutorotate_moment_delay = 0.1;
        
        // ac
        instance.acAutorotate      = NO;
        instance.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskPortrait;
        NSLog(@"UIAlertController 全局修改为 不可旋转, 默认为竖屏。iPad需要修改配置。");
        
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
- (void)vcOrientationAll {
    self.vcAutorotate = YES;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskAll;
    } else {
        self.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskAllButUpsideDown;
    }
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        poporMotionManager.finishBolck = nil;
        if (success) {
            UIDeviceOrientation pmmDeviceOrientation = poporMotionManager.deviceOrientation;
            [UIDevice updateOrientation:pmmDeviceOrientation];
        } else {
            [UIDevice updateOrientation:UIDeviceOrientationPortrait];
        }
        [poporMotionManager stopMonitor];
    }];
}

- (void)vcOrientationLeft {
    self.vcAutorotate_moment = YES;
    self.vcAutorotate = NO;
    self.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeRight;
    [UIDevice updateOrientation:UIDeviceOrientationLandscapeLeft];
}

- (void)vcOrientationRitht {
    self.vcAutorotate_moment = YES;
    self.vcAutorotate = NO;
    self.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeLeft;
    [UIDevice updateOrientation:UIDeviceOrientationLandscapeRight];
}

- (void)vcOrientationLandscape_priorityLeft:(BOOL)priorityLeft {
    // 这个左右是相反的
    UIDeviceOrientation priorityDeviceOrientation = !priorityLeft ? UIDeviceOrientationLandscapeLeft:UIDeviceOrientationLandscapeRight;
    
    self.vcAutorotate = YES;
    self.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskLandscape;
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        poporMotionManager.finishBolck = nil;
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

- (void)vcOrientationUp {
    self.vcAutorotate_moment = YES;
    self.vcAutorotate = NO;
    self.vcSupportedInterfaceOrientations = UIInterfaceOrientationMaskPortrait;
    [UIDevice updateOrientation:UIDeviceOrientationPortrait];
}

- (void)vcOrientationVertical_priorityUp:(BOOL)priorityUp {
    // 这个左右是相反的
    UIDeviceOrientation priorityDeviceOrientation = priorityUp ? UIDeviceOrientationPortrait:UIDeviceOrientationPortraitUpsideDown;
    
    self.vcAutorotate = YES;
    self.vcSupportedInterfaceOrientations = UIDeviceOrientationPortrait +UIDeviceOrientationPortraitUpsideDown;
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        poporMotionManager.finishBolck = nil;
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

#pragma mark - AC 部分
- (void)acOrientationAll {
    self.acAutorotate = YES;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskAll;
    } else {
        self.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

- (void)acOrientationLeft {
    self.acAutorotate = NO;
    self.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeRight;
}

- (void)acOrientationRitht {
    self.acAutorotate = NO;
    self.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeLeft;
}

- (void)acOrientationLandscape_priorityLeft:(BOOL)priorityLeft {
    self.acAutorotate = YES;
    self.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskLandscape;
}

- (void)acOrientationUp {
    self.acAutorotate = NO;
    self.acSupportedInterfaceOrientations = UIInterfaceOrientationMaskPortrait;
}

- (void)acOrientationVertical_priorityUp:(BOOL)priorityUp {
    // 这个左右是相反的
    UIDeviceOrientation priorityDeviceOrientation = priorityUp ? UIDeviceOrientationPortrait:UIDeviceOrientationPortraitUpsideDown;
    
    self.vcAutorotate = YES;
    self.vcSupportedInterfaceOrientations = UIDeviceOrientationPortrait +UIDeviceOrientationPortraitUpsideDown;
    
    self.pMM = [PoporMotionManager new];
    [self.pMM startMonitor:^(PoporMotionManager *poporMotionManager, BOOL success) {
        poporMotionManager.finishBolck = nil;
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
