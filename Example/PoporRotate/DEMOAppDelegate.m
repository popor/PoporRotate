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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
#if TARGET_OS_MACCATALYST
    return UIInterfaceOrientationMaskPortrait;
#else
    PoporRotate * pr = [PoporRotate share];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return pr.vcSupportedInterfaceOrientations;
    } else {
        if (pr.appLoaded) {
            return pr.vcSupportedInterfaceOrientations;
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    }
#endif
}


@end
