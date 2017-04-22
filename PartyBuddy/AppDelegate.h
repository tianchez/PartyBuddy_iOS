//
//  AppDelegate.h
//  PartyBuddy
//
//  Created by 张天琛 on 4/22/17.
//  Copyright © 2017 Tianchen Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

