# UIKit Block-based components

A few UIKit components that use blocks instead of target/actions or delegates. The following components are included:

* UIActionSheet
* UIAlertView
* UIBarButtonItem

## Usage

You can see the sample project in the _Demo_ folder.

### OCActionSheet

Instantiate an action sheet with the following:

	+ (id)actionSheetWithTitle:(NSString *)title;

Then use any of these methods to add buttons to the action sheet:

	- (void)addButtonWithTitle:(NSString *)title 
						action:(void (^)(void))actionBlock;

	- (void)addCancelButtonWithTitle:(NSString *)title 
							  action:(void (^)(void))actionBlock;

	- (void)addDestructiveButtonWithTitle:(NSString *)title 
								   action:(void (^)(void))actionBlock;

Show it the usual way.

### OCAlertView

The easier way is to instantiate an alert view with the following:

	+ (id)alertViewWithTitle:(NSString *)title
				 message:(NSString*)message
			 cancelTitle:(NSString *)cancelTitle
			cancelAction:(void(^)(void))cancelBlock
			confirmTitle:(NSString *)confirmTitle
		   confirmAction:(void(^)(void))confirmBlock;

You could use this method to add a button to an alert view that requires more than 2 buttons:

	- (void)addButtonWithTitle:(NSString *)title action:(void (^)(void))actionBlock;

Show it the usual way.

### OCBarButtonItem

Instantiate a button with any of the following constructors:

	+ (id)itemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem 
						  actionBlock:(void (^)(void))actionBlock;

	+ (id)itemWithCustomView:(UIView *)customView 
				 actionBlock:(void (^)(void))actionBlock;

	+ (id)itemWithImage:(UIImage *)image 
				  style:(UIBarButtonItemStyle)style
			actionBlock:(void (^)(void))actionBlock;

	+ (id)itemWithImage:(UIImage *)image 
	landscapeImagePhone:(UIImage *)landscapeImagePhone 
				  style:(UIBarButtonItemStyle)style
		    actionBlock:(void (^)(void))actionBlock;

	+ (id)itemWithTitle:(NSString *)title 
				  style:(UIBarButtonItemStyle)style 
			actionBlock:(void (^)(void))actionBlock;

You could use this method to set a block to a bar button item (not recommended though):

	- (void)setActionBlock:(void (^)(void))actionBlock;

**WARNING:** Do not set the target and action after you set an action block, the action block won't be called otherwise.

# Important

The code is taking advantage of Automatic Reference Counting (ARC). If your project does not use ARC, you will need to update the code. If you do so, please do it nicely, fork the project and send a pull request.
