//
//  ViewController.m
//  HJSignatureDemo
//
//  Created by Ju on 2018/11/22.
//  Copyright © 2018 HJ. All rights reserved.
//

#define HJScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define HJScreenHeight ([UIScreen mainScreen].bounds.size.height)

#import "SignController.h"
#import "HJSignatureView.h"

static CGFloat const HJButtonHeight = 45;

@interface SignController ()
@property (nonatomic, strong) HJSignatureView *signatureView;
@property (nonatomic, strong) UIButton *clearButton;
@property (nonatomic, strong) UIButton *sureButton;
@end

@implementation SignController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeLeft) forKey:@"orientation"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"orientation" object:@(YES)];
    
}

#pragma mark - UI配置
- (void)configUI {
    [self.view addSubview:self.signatureView];
    [self.view addSubview:self.clearButton];
    [self.view addSubview:self.sureButton];
}

#pragma mark - 点击事件
- (void)operationClicked:(UIButton *)button {
    if (button == self.clearButton) {
        [self.signatureView clear];
    } else {
        NSString *success = [self.signatureView saveTheSignatureWithError:^(NSString * _Nonnull errorMsg) {
            NSLog(@"%@",errorMsg);
        }];
        //返回1表示签名保存成功
        if(![success isEqualToString:@""]) {
            if (self.callback) {
                /* 将扫码结果回传给js */
                if (self.callback) {
                    self.callback(success);
                    self.callback = nil;
                }
                
            }
            
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            
        }
        
    }
}

#pragma mark - set & get
- (HJSignatureView *)signatureView {
    if (!_signatureView) {
        _signatureView = [[HJSignatureView alloc] initWithFrame:CGRectMake(0, 0, HJScreenWidth, HJScreenHeight - 45)];
    }
    return _signatureView;
}

- (UIButton *)clearButton {
    if (!_clearButton) {
        _clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0, HJScreenHeight - HJButtonHeight, HJScreenWidth / 2, HJButtonHeight)];
        [_clearButton setTitle:@"清除" forState:UIControlStateNormal];
        [_clearButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _clearButton.backgroundColor = [UIColor grayColor];
        [_clearButton addTarget:self action:@selector(operationClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearButton;
}

- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = [[UIButton alloc] initWithFrame:CGRectMake(HJScreenWidth / 2, HJScreenHeight - HJButtonHeight, HJScreenWidth / 2, HJButtonHeight)];
        [_sureButton setTitle:@"确认" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sureButton.backgroundColor = [UIColor darkGrayColor];
        [_sureButton addTarget:self action:@selector(operationClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

@end
