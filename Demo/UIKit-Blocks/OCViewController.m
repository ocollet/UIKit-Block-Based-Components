//
//  OCViewController.m
//  UIKit-Blocks
//
//  Created by Olivier Collet on 12-02-23.
//  Copyright (c) 2012 Olivier Collet. All rights reserved.
//

#import "OCViewController.h"
#import "OCActionSheet.h"
#import "OCAlertView.h"
#import "OCBarButtonItem.h"

@interface OCViewController ()

@end

@implementation OCViewController
@synthesize toolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];

	__block OCViewController *bself = self;
	OCBarButtonItem *barButton = [OCBarButtonItem itemWithTitle:@"Black"
															style:UIBarButtonItemStyleBordered
													  actionBlock:^{
														  [bself.view setBackgroundColor:[UIColor blackColor]];
													  }];
	[self.toolbar setItems:[NSArray arrayWithObject:barButton]];
}

- (void)viewDidUnload
{
	[self setToolbar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeColor:(id)sender {
	__block OCViewController *bself = self;
	OCActionSheet *actionSheet = [OCActionSheet actionSheetWithTitle:@"Change color"];
	[actionSheet addDestructiveButtonWithTitle:@"Red" action:^{
		[bself.view setBackgroundColor:[UIColor redColor]];
	}];
	[actionSheet addButtonWithTitle:@"Blue" action:^{
		[bself.view setBackgroundColor:[UIColor blueColor]];
	}];
	[actionSheet addButtonWithTitle:@"Green" action:^{
		[bself.view setBackgroundColor:[UIColor greenColor]];
	}];
	[actionSheet addCancelButtonWithTitle:@"Cancel" action:nil];
	[actionSheet showFromToolbar:self.toolbar];
}

- (IBAction)reset:(id)sender {
	__block OCViewController *bself = self;
	OCAlertView *alertView = [OCAlertView alertViewWithTitle:@"Reset"
													 message:@"Are you sure you want to reset the color?"
												 cancelTitle:@"No"
												cancelAction:nil
												confirmTitle:@"Yes"
											   confirmAction:^{
												   [bself.view setBackgroundColor:[UIColor whiteColor]];
											   }];
	[alertView show];
}


@end
