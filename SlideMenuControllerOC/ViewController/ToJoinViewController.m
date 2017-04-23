//
//  ToJoinViewController.m
//  PartyBuddy
//
//  Created by 张天琛 on 4/23/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import "ToJoinViewController.h"

@interface ToJoinViewController ()

@end

@implementation ToJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.CancelButton addTarget:self action:@selector(cancelClicked) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarItem];
    self.navigationController.navigationBar.topItem.title = @"Join";
}

- (void) cancelClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"dismiss!!");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
