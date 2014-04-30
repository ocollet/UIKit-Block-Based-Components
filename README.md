# UIKit Block-based components

A few UIKit components that use blocks instead of target/actions or delegates. The following components are included:

* UIActionSheet
* UIAlertView
* UIBarButtonItem

## Installation

UIKit-Block-Based-Components is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "UIKit-Block-Based-Components"

## Usage

You can see the sample project in the _Example_ folder.

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

## Author

Olivier Collet [@ocollet](https://github.com/ocollet)

## License

UIKit-Block-Based-Components is available under the MIT license. See the LICENSE file for more info.
