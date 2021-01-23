//
//  PoporRotate.h
//  PoporRotate
//
//  Created by popor on 2020/7/25.
//  Copyright © 2020 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PoporMotionManager.h"
#import "UIDevice+PoporRotate.h"

NS_ASSUME_NONNULL_BEGIN

@interface PoporRotate : NSObject

@property (nonatomic        ) BOOL appLoaded;

// vc 和 nc
@property (nonatomic        ) BOOL vcAutorotate;
@property (nonatomic        ) UIInterfaceOrientationMask vcSupportedInterfaceOrientations; // 默认为UIInterfaceOrientationMaskPortrait

@property (nonatomic        ) BOOL vcAutorotate_moment;// 打开一段时间后关闭, 默认为0.1秒后关闭
@property (nonatomic        ) CGFloat vcAutorotate_moment_delay;// 默认为0.1秒后关闭

// ac
@property (nonatomic        ) BOOL acAutorotate; // 默认为NO
@property (nonatomic        ) UIInterfaceOrientationMask acSupportedInterfaceOrientations; // 默认为UIInterfaceOrientationMaskPortrait

//
@property (nonatomic, strong) PoporMotionManager * pMM;

+ (instancetype)share;

#pragma mark - VC 部分
- (void)vcOrientationAll;  // iPhone只有上左右, iPad有上下左右.

- (void)vcOrientationLeft; // 针对于iPhone或者iPad.
- (void)vcOrientationRitht;// 针对于iPhone或者iPad.

- (void)vcOrientationLandscape_priorityLeft:(BOOL)priorityLeft;// 针对于iPhone或者iPad.

- (void)vcOrientationUp;   // 一般只针对iPhone.

- (void)vcOrientationVertical_priorityUp:(BOOL)priorityUp;// 针对于iPad.

#pragma mark - AC 部分
- (void)acOrientationAll;  // iPhone只有上左右, iPad有上下左右.

- (void)acOrientationLeft; // 针对于iPhone或者iPad.
- (void)acOrientationRitht;// 针对于iPhone或者iPad.

- (void)acOrientationLandscape_priorityLeft:(BOOL)priorityLeft;// 针对于iPhone或者iPad.

- (void)acOrientationUp;   // 一般只针对iPhone.

- (void)acOrientationVertical_priorityUp:(BOOL)priorityUp;// 针对于iPad.

@end

NS_ASSUME_NONNULL_END
