//
//  UIDevice+PoporRotate.h
//  PoporRotate
//
//  Created by popor on 2020/12/31.
//  Copyright © 2020 popor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (PoporRotate)

+ (void)updateOrientation:(UIDeviceOrientation)orientation; // 等同于3
+ (void)updateOrientation_3:(UIDeviceOrientation)orientation;
+ (void)updateOrientation_5:(UIDeviceOrientation)orientation;

+ (void)updateOrientation_onceNumber:(NSNumber *)orientationNumber;
+ (void)updateOrientation_once:(UIDeviceOrientation)orientation; // 基础函数

+ (UIInterfaceOrientation)interfaceOrientation_deviceOrientation:(UIDeviceOrientation)deviceOrientation;
+ (UIInterfaceOrientationMask)interfaceOrientationMask_deviceOrientation:(UIDeviceOrientation)deviceOrientation;
+ (UIDeviceOrientation)deviceOrientation_interfaceOrientationMask:(UIInterfaceOrientationMask)ioMask;
+ (UIImageOrientation)imageOrientation_deviceOrientation:(UIDeviceOrientation)deviceOrientation;


@end

NS_ASSUME_NONNULL_END
