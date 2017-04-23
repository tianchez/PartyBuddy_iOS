//
//  LeftViewController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "LeftViewController.h"
#import "JoinViewController.h"
#import "HelpViewController.h"
#import "HostViewController.h"
#import "AboutusController.h"
#import "BaseTableViewCell.h"

@implementation LeftViewController

-(void)viewDidLoad {
    _menus = @[@"Home", @"Join", @"Host", @"Help", @"About us"];
    self.tableView.separatorColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    JoinViewController *joinViewController = (JoinViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"JoinViewController"];
    self.joinViewController = [[UINavigationController alloc] initWithRootViewController: joinViewController];
    
    HostViewController *hostViewController = (HostViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"HostViewController"];
    self.hostViewController = [[UINavigationController alloc] initWithRootViewController: hostViewController];
    
    HelpViewController *helpViewController = (HelpViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"HelpViewController"];
    self.helpViewController = [[UINavigationController alloc] initWithRootViewController: helpViewController];
    
    AboutusController *aboutusController = (AboutusController *)[storyboard  instantiateViewControllerWithIdentifier:@"AboutusController"];
    aboutusController.delegate = self;
    self.aboutusController = [[UINavigationController alloc] initWithRootViewController: aboutusController];
    
    [_tableView registerCellClass:[BaseTableViewCell class]];
    
    self.imageHeaderView = (ImageHeaderView *)[ImageHeaderView loadNib];
    [self.view addSubview:self.imageHeaderView];
    self.imageHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 160);
    [self.view layoutIfNeeded];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.imageHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 160);
    [self.view layoutIfNeeded];
}

-(void)changeViewController:(LeftMenu) menu {
    switch (menu) {
        case LeftMenuMain:
            [self.slideMenuController changeMainViewController:self.mainViewControler close:YES];
            break;
        case LeftMenuSwift:
            [self.slideMenuController changeMainViewController:self.joinViewController close:YES];
            break;
        case LeftMenuJava:
            [self.slideMenuController changeMainViewController:self.hostViewController close:YES];
            break;
        case LeftMenuGo:
            [self.slideMenuController changeMainViewController:self.helpViewController close:YES];
            break;
        case LeftMenuNonMenu:
            [self.slideMenuController changeMainViewController:self.aboutusController close:YES];
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  [BaseTableViewCell height];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menus.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableViewCell *cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[BaseTableViewCell identifier]];
    [cell setData:_menus[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self changeViewController:indexPath.row];
}

@end
