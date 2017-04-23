//
//  ExSlideMenuController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "ExSlideMenuController.h"
#import "UIApplication+SlideMenuControllerOC.h"
#import "JoinViewController.h"
#import "HelpViewController.h"
#import "HostViewController.h"
#import "AboutusController.h"
#import "MainViewController.h"

@interface ExSlideMenuController ()

@end

@implementation ExSlideMenuController

-(BOOL)isTagetViewController {
    UIViewController *vc = [UIApplication topViewController];
    if ([vc isKindOfClass:[MainViewController class]]
        || [vc isKindOfClass:[JoinViewController class]]
        || [vc isKindOfClass:[HelpViewController class]]
        || [vc isKindOfClass:[HostViewController class]]) {
        return YES;
    }
    return NO;
}

-(void)track:(TrackAction)action {
    switch (action) {
        case TrackActionLeftTapOpen:
            NSLog(@"TrackAction: left tap open.");
            break;
        case TrackActionLeftTapClose:
            NSLog(@"TrackAction: left tap close.");
            break;
        case TrackActionLeftFlickOpen:
            NSLog(@"TrackAction: left flick open.");
            break;
        case TrackActionLeftFlickClose:
            NSLog(@"TrackAction: left flick close.");
            break;
        case TrackActionRightTapOpen:
            NSLog(@"TrackAction: right tap open.");
            break;
        case TrackActionRightTapClose:
            NSLog(@"TrackAction: right tap close.");
            break;
        case TrackActionRightFlickOpen:
            NSLog(@"TrackAction: right flick open.");
            break;
        case TrackActionRightFlickClose:
            NSLog(@"TrackAction: right flick close.");
            break;
        default:
            break;
    }
}

@end
