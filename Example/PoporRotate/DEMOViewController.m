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
    
    self.infoArray = @[
    @[@"自动", @"左转", @"右转", @"横屏_左", @"横屏_右", @"竖屏", @"竖屏_上", @"竖屏_下",],
    @[@"自动", @"左转", @"右转", @"横屏_左", @"横屏_右", @"竖屏", @"竖屏_上", @"竖屏_下",],
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray * array = self.infoArray[indexPath.section];
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"%li : VC %@", indexPath.row, array[indexPath.row]];
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"%li : AC %@", indexPath.row, array[indexPath.row]];
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
            [self vcAction:indexPath.row];
            break;
        case 1:
            [self acAction:indexPath.row];
            break;
        default:
            break;
    }
    
}

- (void)vcAction:(NSInteger)tag {
    switch (tag) {
        case 0: {
            [self.pr vcOrientationAll];
            break;
        }
        case 1: {
            [self.pr vcOrientationLeft];
            break;
        }
        case 2: {
            [self.pr vcOrientationRitht];
            break;
        }
        case 3: {
            [self.pr vcOrientationLandscape_priorityLeft:YES];
            break;
        }
        case 4: {
            [self.pr vcOrientationLandscape_priorityLeft:NO];
            break;
        }
        case 5: {
            [self.pr vcOrientationUp];
            break;
        }
        case 6: { // 手边没iPad没有测试
            [self.pr vcOrientationVertical_priorityUp:YES];
            break;
        }
        case 7: { // 手边没iPad没有测试
            [self.pr vcOrientationVertical_priorityUp:NO];
            break;
        }
        default:
            break;
    }
}

- (void)acAction:(NSInteger)tag {
    switch (tag) {
        case 0: {
            [self.pr acOrientationAll];
            break;
        }
        case 1: {
            [self.pr acOrientationLeft];
            break;
        }
        case 2: {
            [self.pr acOrientationRitht];
            break;
        }
        case 3: {
            [self.pr acOrientationLandscape_priorityLeft:YES];
            break;
        }
        case 4: {
            [self.pr acOrientationLandscape_priorityLeft:NO];
            break;
        }
        case 5: {
            [self.pr acOrientationUp];
            break;
        }
        case 6: { // 手边没iPad没有测试
            [self.pr acOrientationVertical_priorityUp:YES];
            break;
        }
        case 7: { // 手边没iPad没有测试
            [self.pr acOrientationVertical_priorityUp:NO];
            break;
        }
        default:
            break;
    }
    
    {
        UIAlertController * oneAC = [UIAlertController alertControllerWithTitle:@"提醒" message:@"确认吗?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [oneAC addAction:cancleAction];
        [oneAC addAction:okAction];
        
        [self.navigationController presentViewController:oneAC animated:YES completion:nil];
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
