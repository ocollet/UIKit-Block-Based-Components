//
//  OCActionSheet.h
//
//  Created by Olivier Collet on 11-09-28.
//  Copyright (c) 2011 Olivier Collet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCActionSheet : UIActionSheet <UIActionSheetDelegate>

+ (id)actionSheetWithTitle:(NSString *)title;

- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;
- (void)addCancelButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;
- (void)addDestructiveButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;

@end
