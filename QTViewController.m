//
//  QTViewController.m
//  QTHandleOrientationChanges
//
//  Created by Tang Qi on 06/03/2017.
//  Copyright © 2017 Tang. All rights reserved.
//

#import "QTViewController.h"
#import <Masonry/Masonry.h>

@interface QTViewController ()

@property (nonatomic, strong) UIView *redView;

@end

@implementation QTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];

    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 UIKit calls this method before changing the size of a presented view controller’s view. You can override this method in your own objects and use it to perform additional tasks related to the size change. For example, a container view controller might use this method to override the traits of its embedded child view controllers. Use the provided coordinator object to animate any changes you make.
 If you override this method in your custom view controllers, always call super at some point in your implementation so that UIKit can forward the size change message appropriately. View controllers forward the size change message to their views and child view controllers. Presentation controllers forward the size change to their presented view controller.
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:].
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // Place code here to perform animations during the rotation.
        // You can pass nil for this closure if not necessary.
        // Reorganize views, or move child view controllers.
        if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
            self.redView.backgroundColor = [UIColor blueColor];
            [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(200, 200));
            }];
        }

        if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
            self.redView.backgroundColor = [UIColor redColor];
            [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100, 100));
            }];
        }
    }
                                 completion:^(id<UIViewControllerTransitionCoordinatorContext> context){
                                     // Code here will execute after the rotation has finished.
                                     // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:].
                                     // Do any cleanup, if necessary.
                                 }];
}

@end
