//
//  LeftViewController.h
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageHeaderView.h"

typedef enum : NSInteger{
    LeftMenuMain = 0,
    LeftMenuSwift,
    LeftMenuJava,
    LeftMenuGo,
    LeftMenuNonMenu
} LeftMenu;

@protocol LeftMenuProtocol <NSObject>

@required
-(void)changeViewController:(LeftMenu) menu;

@end

@interface LeftViewController : UIViewController<LeftMenuProtocol, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (retain, nonatomic) NSArray *menus;
@property (retain, nonatomic) UIViewController *mainViewControler;
@property (retain, nonatomic) UIViewController *joinViewController;
@property (retain, nonatomic) UIViewController *hostViewController;
@property (retain, nonatomic) UIViewController *helpViewController;
@property (retain, nonatomic) UIViewController *aboutusController;
@property (retain, nonatomic) ImageHeaderView *imageHeaderView;



@end
