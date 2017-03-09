//
//  QTViewController.m
//  QTHandleOrientationChanges
//
//  Created by Tang Qi on 06/03/2017.
//  Copyright © 2017 Tang. All rights reserved.
//

#import "QTViewController.h"
#import "QTModalViewController.h"
#import <Masonry/Masonry.h>

@implementation QTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton new];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"Click Me" forState:UIControlStateNormal];
    button.layer.cornerRadius = 4;
    [self.view addSubview:button];

    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];

    [button addTarget:self action:@selector(clickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickedAction:(id)sender {
    QTModalViewController *modalViewController = [[QTModalViewController alloc] init];
    modalViewController.title = @"QTModalViewController";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:modalViewController];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    navigationController.preferredContentSize = CGSizeMake(560, 720);
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    NSLog(@"Before: %f", [UIScreen mainScreen].bounds.size.width);
    NSLog(@"Before: %f", [UIScreen mainScreen].bounds.size.height);
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        NSLog(@"After: %f", [UIScreen mainScreen].bounds.size.width);
        NSLog(@"After: %f", [UIScreen mainScreen].bounds.size.height);
    }
                                 completion:^(id<UIViewControllerTransitionCoordinatorContext> context){
                                     
                                 }];
}

@end
