//
//  UIDevice+PoporRotate.h
//  PoporRotate
//
//  Created by popor on 2020/12/31.
//  Copyright © 2020 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define PScreenWidth  [UIDevice portainWidth]
#define PScreenHeight [UIDevice portainHeight]

@interface UIDevice (PoporRotate)

+ (void)updateOrientation:(UIDeviceOrientation)orientation; // 等同于5
+ (void)updateOrientation_5:(UIDeviceOrientation)orientation;

+ (void)updateOrientation_onceNumber:(NSNumber *)orientationNumber;
+ (void)updateOrientation_once:(UIDeviceOrientation)orientation; // 基础函数

+ (CGFloat)portainWidth;
+ (CGFloat)portainHeight;

+ (UIInterfaceOrientation)interfaceOrientation_deviceOrientation:(UIDeviceOrientation)deviceOrientation;
+ (UIInterfaceOrientationMask)interfaceOrientationMask_deviceOrientation:(UIDeviceOrientation)deviceOrientation;
+ (UIImageOrientation)imageOrientation_deviceOrientation:(UIDeviceOrientation)deviceOrientation;


@end

NS_ASSUME_NONNULL_END
