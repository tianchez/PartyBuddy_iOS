//
//  JavaViewController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "HostViewController.h"
#import "AFHTTPSessionManager.h"
#include <time.h>
#include <stdlib.h>
#import "FacebookDataSource.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation HostViewController

NSString* username;
NSString* longitude_text;
NSString* latitude_text;

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.sendButton addTarget:self action:@selector(submitHostToJava) forControlEvents:UIControlEventTouchUpInside];
    
    FacebookDataSource* fbdata = [FacebookDataSource sharedInstance];
    username = [NSString stringWithFormat:@"%@ %@",fbdata.user_firstName,fbdata.user_lastName];
    longitude_text = [fbdata.longitute stringValue];
    latitude_text = [fbdata.latitude stringValue];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:fbdata.user_picture_url] placeholderImage:[UIImage imageNamed:@"party_background"]];
    self.addressField.text = [NSString stringWithFormat:@"(%@, %@)",latitude_text,longitude_text];
    self.nameLabel.text = username;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarItem];
    self.navigationController.navigationBar.topItem.title = @"Host";
}

- (void) submitHostToJava
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    srand(time(NULL));
    int r = rand() % 740000;
    NSString* partyID = [NSString stringWithFormat:@"%d",r];

    

    
    NSDictionary *params = @{@"action": @"host",
                             @"username": username,
                             @"partyID": partyID,
                             @"partyName":self.eventNameField.text,
                             @"description":self.descriptionTextView.text,
                             @"longitude":longitude_text,
                             @"latitude":latitude_text};
    [manager POST:@"http://54.69.197.209/update/" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"$$$JSON: %@", responseObject);
        [_delegate changeViewController:LeftMenuMain];

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"$$$Error: %@", error);
        [_delegate changeViewController:LeftMenuMain];


    }];
}

@end
