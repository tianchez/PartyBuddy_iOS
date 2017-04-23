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

@implementation HostViewController

-(void)viewDidLoad {
    [super viewDidLoad];
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

    FacebookDataSource* fbdata = [FacebookDataSource sharedInstance];
    NSString* username = [NSString stringWithFormat:@"%@ %@",fbdata.user_firstName,fbdata.user_lastName];
    NSString* longitude_text = [fbdata.longitute stringValue];
    NSString* latitude_text = [fbdata.latitude stringValue];

    
    NSDictionary *params = @{@"action": @"host",
                             @"username": username,
                             @"partyID": partyID,
                             @"partyName":@"sdjfhsjkdh33",
                             @"description":@"sdfsf44",
                             @"longitude":longitude_text,
                             @"lattitude":latitude_text};
    [manager POST:@"http://54.69.197.209/update/" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"$$$JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"$$$Error: %@", error);
    }];
}

@end
