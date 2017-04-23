//
//  NonMenuController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "AboutusController.h"

@implementation AboutusController

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self removeNavigationBarItem];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        UIViewController *vc = ((UINavigationController *)self.slideMenuController.mainViewController).topViewController;
        if (vc != nil) {
            if ([vc isKindOfClass:[AboutusController class]]) {
                [[self slideMenuController] removeLeftGestures];
                [[self slideMenuController] removeRightGestures];
            }
        }
    }];
}

-(IBAction)didTouchToMain:(id)sender {
    if (_delegate != nil && [_delegate respondsToSelector:@selector(changeViewController:)]) {
        [_delegate changeViewController:LeftMenuMain];
    }
}

@end
