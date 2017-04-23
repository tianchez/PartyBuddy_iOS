//
//  FirstViewController.h
//  PartyBuddy
//
//  Created by 张天琛 on 4/22/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "FacebookDataSource.h"

@interface FirstViewController :UIViewController<FBSDKLoginButtonDelegate>


@property (nonatomic, strong) NSString* user_firstName;
@property (nonatomic, strong) NSString* user_lastName;
@property (nonatomic, strong) NSString* user_picture_url;
@property (nonatomic, strong) FBSDKLoginButton* loginButton;


@end
