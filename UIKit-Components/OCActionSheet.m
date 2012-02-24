//
//  OCActionSheet.m
//
//  Created by Olivier Collet on 11-09-28.
//  Copyright (c) 2011 Olivier Collet. All rights reserved.
//

#import "OCActionSheet.h"

typedef void(^OCActionSheetActionBlock)(void);

//

@interface OCActionSheetAction : NSObject {
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, copy) OCActionSheetActionBlock actionBlock;

- (id)initWithTitle:(NSString *)title actionBlock:(OCActionSheetActionBlock)actionBlock;
+ (id)actionWithTitle:(NSString *)title actionBlock:(OCActionSheetActionBlock)actionBlock;

@end

//

@interface OCActionSheet ()

@property (nonatomic,retain) NSMutableArray *actions;

@end

//

@implementation OCActionSheet
@synthesize actions;

- (void)postInit {
	self.actions = [NSMutableArray array];
}

- (id)init {
	self = [super init];
	if (self) {
		[self postInit];
	}
	return self;
}

+ (id)actionSheetWithTitle:(NSString *)title {
	return [[OCActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
}

#pragma mark - Show

- (void)prepareShow {
	if (self.numberOfButtons != [self.actions count]) {
		for (OCActionSheetAction *action in self.actions) {
			[super addButtonWithTitle:action.title];
		}
	}

	self.delegate = self;
}

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated {
	self.cancelButtonIndex = -1;
	[self prepareShow];
	[super showFromBarButtonItem:item animated:animated];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated {
	self.cancelButtonIndex = -1;
	[self prepareShow];
	[super showFromRect:rect inView:view animated:animated];
}

- (void)showFromTabBar:(UITabBar *)view {
	[self prepareShow];
	[super showFromTabBar:view];
}

- (void)showFromToolbar:(UIToolbar *)view {
	[self prepareShow];
	[super showFromToolbar:view];
}

- (void)showInView:(UIView *)view {
	[self prepareShow];
	[super showInView:view];
}

- (NSInteger)addButtonWithTitle:(NSString *)title {
	NSAssert(NO, @"Not allowed to use this method. You should use addButtonWithTitle:action: instead.");
	return -1;
}

#pragma mark - Buttons

- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock {
	if (title == nil) return;
	[self.actions addObject:[OCActionSheetAction actionWithTitle:title actionBlock:actionBlock]];
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock {
	if (title == nil) return;
	[self.actions addObject:[OCActionSheetAction actionWithTitle:title actionBlock:actionBlock]];
	self.cancelButtonIndex = [self.actions count] - 1;
}

- (void)addDestructiveButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock {
	if (title == nil) return;
	[self.actions addObject:[OCActionSheetAction actionWithTitle:title actionBlock:actionBlock]];
	self.destructiveButtonIndex = [self.actions count] - 1;
}

#pragma mark - UIActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (buttonIndex >= [self.actions count]) return;
	OCActionSheetAction *action = [self.actions objectAtIndex:buttonIndex];
	if (action.actionBlock) action.actionBlock();
}

@end


#pragma mark -
#pragma mark - OCActionSheetAction

@implementation OCActionSheetAction

@synthesize title = _title;
@synthesize actionBlock = _actionBlock;

- (id)initWithTitle:(NSString *)title actionBlock:(OCActionSheetActionBlock)actionBlock {
	self = [super init];
	if (self) {
		self.title = title;
		self.actionBlock = actionBlock;
	}
	return self;
}

+ (id)actionWithTitle:(NSString *)title actionBlock:(OCActionSheetActionBlock)actionBlock {
	return [[OCActionSheetAction alloc] initWithTitle:title actionBlock:actionBlock];
}

@end