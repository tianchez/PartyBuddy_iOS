//
//  ToJoinViewController.m
//  PartyBuddy
//
//  Created by 张天琛 on 4/23/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import "ToJoinViewController.h"
#import "FacebookDataSource.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AFHTTPSessionManager.h"

@interface ToJoinViewController ()

@end

@implementation ToJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FacebookDataSource* fbdata = [FacebookDataSource sharedInstance];
    NSString* username = [NSString stringWithFormat:@"%@ %@",fbdata.user_firstName,fbdata.user_lastName];
    NSString* longitude_text = [fbdata.longitute stringValue];
    NSString* latitude_text = [fbdata.latitude stringValue];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
        [manager GET:@"http://www.mapquestapi.com/geocoding/v1/reverse?key=XwWt1IGMhfAc3wUnh6iWBBk0C7WQj7ZZ&location=-22.9035393,-43.2095869&includeRoadMetadata=true&includeNearestIntersection=true" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"$$$Map: %@", responseObject);
            NSLog(@"haha");
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"$$$Error: %@", error);
    }];

    
    
     [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:fbdata.user_picture_url] placeholderImage:[UIImage imageNamed:@"party_background"]];
    [self.CancelButton addTarget:self action:@selector(cancelClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.joinButton addTarget:self action:@selector(joinClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
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

-(void) joinClicked
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
