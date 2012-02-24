//
//  OCAlertView.h
//
//  Created by Olivier Collet on 11-07-10.
//  Copyright 2011 Olivier Collet. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OCAlertView : UIAlertView <UIAlertViewDelegate>

+ (id)alertViewWithTitle:(NSString *)title
				 message:(NSString*)message
			 cancelTitle:(NSString *)cancelTitle
			cancelAction:(void(^)(void))cancelBlock
			confirmTitle:(NSString *)confirmTitle
		   confirmAction:(void(^)(void))confirmBlock;

- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;

@end
