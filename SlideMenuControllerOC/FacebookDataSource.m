//
//  FacebookDataSource.m
//  PartyBuddy
//
//  Created by 张天琛 on 4/23/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import "FacebookDataSource.h"

@implementation FacebookDataSource


@synthesize user_firstName = _user_firstName;
@synthesize user_lastName = _user_lastName;
@synthesize user_picture_url = _user_picture_url;
@synthesize latitude = _latitude;
@synthesize longitute = _longitute;


+ (FacebookDataSource *)sharedInstance {
    static dispatch_once_t onceToken;
    static FacebookDataSource *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[FacebookDataSource alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _user_firstName = nil;
        _user_lastName = nil;
        _user_picture_url = nil;
        _latitude = nil;
        _longitute = nil;
    }
    return self;
}


@end
