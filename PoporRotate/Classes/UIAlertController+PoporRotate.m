//
//  UIAlertController+PoporRotate.m
//  PoporRotate
//
//  Created by popor on 2020/11/28.
//

#import "UIAlertController+PoporRotate.h"
#import "PoporRotate.h"

@implementation UIAlertController (pAutorotate)

- (BOOL)shouldAutorotate {
    return [PoporRotate share].acAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [PoporRotate share].acSupportedInterfaceOrientations;
}

@end

