//
//  NonMenuController.h
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"

@interface AboutusController : UIViewController

@property (weak, nonatomic) id<LeftMenuProtocol> delegate;

@end
