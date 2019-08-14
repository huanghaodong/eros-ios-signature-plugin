//
//  HJSignatureView.h
//  HJSignatureDemo
//
//  Created by Ju on 2018/11/22.
//  Copyright © 2018 HJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJSignatureView : UIView

- (NSString*)encodeToBase64String:(UIImage *)image;

/**
 清除签名
 */
- (void)clear;



/**
 保存签名

 @return 保存在本地的图片路径
 */
- (NSString *)saveTheSignatureWithError:(void(^)(NSString *errorMsg))errorBlock;
@end

NS_ASSUME_NONNULL_END
