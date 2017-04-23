//
//  UIViewController+SlideMenuControllerOC.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "UIViewController+SlideMenuControllerOC.h"
#import "SlideMenuController.h"

@implementation UIViewController (SlideMenuControllerOC)

-(void)setNavigationBarItem {
    [self addLeftBarButtonWithImage:[UIImage imageNamed:@"ic_menu_black_24dp"]];
    [self addRightBarButtonWithImage:[UIImage imageNamed:@"ic_notifications_black_24dp"]];
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    //[bar setTintColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
    [bar setBackgroundColor:[UIColor clearColor]];
    
    [self.slideMenuController removeLeftGestures];
    [self.slideMenuController removeRightGestures];
    [self.slideMenuController addLeftGestures];
    [self.slideMenuController addRightGestures];
}

-(void)removeNavigationBarItem {
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    [self.slideMenuController removeLeftGestures];
    [self.slideMenuController removeRightGestures];
}

@end