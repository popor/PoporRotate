#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PoporMotionManager.h"
#import "PoporRotate.h"
#import "UIDevice+PoporRotate.h"
#import "UINavigationController+PoporRotate.h"
#import "UIViewController+PoporRotate.h"

FOUNDATION_EXPORT double PoporRotateVersionNumber;
FOUNDATION_EXPORT const unsigned char PoporRotateVersionString[];

