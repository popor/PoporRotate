//
//  DEMOAppDelegate.m
//  PoporRotate
//
//  Created by popor on 01/22/2021.
//  Copyright (c) 2021 popor. All rights reserved.
//

#import "DEMOAppDelegate.h"
#import <PoporRotate/PoporRotate.h>

@implementation DEMOAppDelegate

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
#if TARGET_OS_MACCATALYST
    return UIInterfaceOrientationMaskPortrait;
#else
    PoporRotate * pr = [PoporRotate share];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return pr.supportedInterfaceOrientations;
    } else {
        if (pr.appLoaded) {
            //NSLog(@"app pr: %li, %@", (long)pr.supportedInterfaceOrientations, [self binary:pr.supportedInterfaceOrientations]);
            //pr.supportedInterfaceOrientations = UIInterfaceOrientationMaskLandscapeLeft |UIInterfaceOrientationMaskLandscapeRight;
            
            NSMutableString * or = [NSMutableString new];
            if (pr.supportedInterfaceOrientations & UIInterfaceOrientationMaskPortrait) {
                [or appendString:@"上"];
            }
            if (pr.supportedInterfaceOrientations & UIInterfaceOrientationMaskLandscapeLeft) {
                [or appendString:@"右"];
            }
            if (pr.supportedInterfaceOrientations & UIInterfaceOrientationMaskLandscapeRight) {
                [or appendString:@"左"];
            }
            if (pr.supportedInterfaceOrientations & UIInterfaceOrientationMaskPortraitUpsideDown) {
                [or appendString:@"下"];
            }
            NSLog(@"or: %@", or);
            
            return pr.supportedInterfaceOrientations;
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    }
#endif
}

- (NSString *)binary:(NSInteger)decimalism {
    
    //NSInteger decimalism = self.integerValue; // 把输入的十进制字符串 转为 int类型
    
    BOOL isReverse = NO; // 控制是否反码
    
    if (decimalism < 0) { // 输入的十进制如果是小于零的话，二进制反码
        decimalism = -decimalism;
        isReverse = YES;
    }
    NSMutableString *result = [NSMutableString new];
    while (decimalism > 0) {  // 当商等于0时，循环终止
        NSInteger temp = decimalism % 2;
        decimalism = decimalism /2;
        // 余数倒序拼接，余数一直拼在result字符串的前面
        // 正数直接取余数倒序，负数二进制进行0和1的反码互换后倒序拼接
        NSString *tempString = [NSString stringWithFormat:@"%ld", isReverse ? (temp == 0 ? 1 : 0) : temp];
        result = [tempString stringByAppendingString:result];
        
    }
    return result;
}


@end
