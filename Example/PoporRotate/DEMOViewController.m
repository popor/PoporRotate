//
//  DEMOViewController.m
//  PoporRotate
//
//  Created by popor on 01/22/2021.
//  Copyright (c) 2021 popor. All rights reserved.
//

#import "DEMOViewController.h"
#import <PoporRotate/PoporRotate.h>
#import <Masonry/Masonry.h>

static NSString * Rotate1_0 = @"自动";
static NSString * Rotate1_1 = @"左转";
static NSString * Rotate1_2 = @"右转";

static NSString * Rotate2_0 = @"横屏_左";
static NSString * Rotate2_1 = @"横屏_右";
static NSString * Rotate2_2 = @"全部_上";
static NSString * Rotate2_3 = @"全部_左";
static NSString * Rotate2_4 = @"全部_右";

static NSString * Rotate3_0 = @"竖屏";
static NSString * Rotate3_1 = @"竖屏_上";
static NSString * Rotate3_2 = @"竖屏_下";


@interface DEMOViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak  ) PoporRotate * pr;

@property (nonatomic, copy  ) NSArray * infoArray;
@property (nonatomic, strong) UITableView * infoTV;

@end

@implementation DEMOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pr = [PoporRotate share];
    self.pr.appLoaded = YES;
    
    self.title = @"Rotate";
    
    self.infoArray =
    @[
        @[Rotate1_0, Rotate1_1, Rotate1_2,],
        @[Rotate2_0, Rotate2_1, Rotate2_2, Rotate2_3, Rotate2_4,],
        @[Rotate3_0, Rotate3_1, Rotate3_2,],
    ];
    
    self.infoTV = [self addTVs];
}

#pragma mark - UITableView
- (UITableView *)addTVs {
    UITableView * oneTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    oneTV.delegate   = self;
    oneTV.dataSource = self;
    
    oneTV.allowsMultipleSelectionDuringEditing = YES;
    oneTV.directionalLockEnabled = YES;
    
    oneTV.estimatedRowHeight           = 0;
    oneTV.estimatedSectionHeaderHeight = 0;
    oneTV.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:oneTV];
    
    [oneTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-0);
        make.right.mas_equalTo(-0);
    }];
    return oneTV;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.infoArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * array = self.infoArray[section];
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section +1 == self.infoArray.count) {
        return 20;
    } else {
        return 0.1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellID = @"CellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray * array = self.infoArray[indexPath.section];
    cell.textLabel.text = [NSString stringWithFormat:@"%li : VC %@", indexPath.row, array[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray * array = self.infoArray[indexPath.section];
    [self vcAction:array[indexPath.row]];
}

- (void)vcAction:(NSString *)text {
    if ([text isEqualToString:Rotate1_0]) {
        [self.pr orientationAll];
        return;
    }
    else if([text isEqualToString:Rotate1_1]) {
        [self.pr orientationLeft];
        return;
    }
    else if([text isEqualToString:Rotate1_2]) {
        [self.pr orientationRitht];
        return;
    }
    
    //....................................................................................
    else if([text isEqualToString:Rotate2_0]) {
        //[self.pr orientationLandscape_priorityLeft:YES]; // 等同于下面
        [self.pr orientation_all:UIInterfaceOrientationMaskLandscape priority:UIInterfaceOrientationMaskLandscape high:UIInterfaceOrientationMaskLandscapeRight];
        return;
    }
    else if([text isEqualToString:Rotate2_1]) {
        //[self.pr orientationLandscape_priorityLeft:NO]; // 等同于下面
        [self.pr orientation_all:UIInterfaceOrientationMaskLandscape priority:UIInterfaceOrientationMaskLandscape high:UIInterfaceOrientationMaskLandscapeLeft];
        
        return;
    }
    else if([text isEqualToString:Rotate2_2]) {
        [self.pr orientation_all:UIInterfaceOrientationMaskAll priority:UIInterfaceOrientationMaskLandscape high:UIInterfaceOrientationMaskPortrait];
        return;
    }
    else if([text isEqualToString:Rotate2_3]) {
        [self.pr orientation_all:UIInterfaceOrientationMaskAll priority:UIInterfaceOrientationMaskLandscape high:UIInterfaceOrientationMaskLandscapeRight];
        return;
    }
    else if([text isEqualToString:Rotate2_4]) {
        [self.pr orientation_all:UIInterfaceOrientationMaskAll priority:UIInterfaceOrientationMaskLandscape high:UIInterfaceOrientationMaskLandscapeLeft];
        return;
    }
    
    //....................................................................................
    else if([text isEqualToString:Rotate3_0]) {
        [self.pr orientationUp];
        return;
    }
    else if([text isEqualToString:Rotate3_1]) {
        [self.pr orientationVertical_priorityUp:YES];
        return;
    }
    else if([text isEqualToString:Rotate3_2]) {
        [self.pr orientationVertical_priorityUp:NO];
        return;
    }
    
    
}

- (CGFloat)statusBarHeight {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        return mainWindow.safeAreaInsets.top;
    }else{
        return 20;
    }
}

@end
