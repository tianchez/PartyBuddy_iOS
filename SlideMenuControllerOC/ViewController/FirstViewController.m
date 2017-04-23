//
//  FirstViewController.m
//  PartyBuddy
//
//  Created by 张天琛 on 4/22/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "ExSlideMenuController.h"



@implementation FirstViewController


ExSlideMenuController *slideMenuController;
FacebookDataSource *fbdata;

-(void)viewDidLoad {
    [super viewDidLoad];

    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton.delegate = self;
    [self.loginButton setFrame:CGRectMake( 100, 200, 160, 30)];
    //loginButton.frame =  CGRect(x: UIScreen.main.bounds.width/2-80, y: TitleText.frame.origin.y + 150, width: 160, height: 30)
    self.loginButton.readPermissions =@[@"public_profile", @"email", @"user_friends"];
    
    
    fbdata = [FacebookDataSource sharedInstance];
    
    [self.view addSubview:self.loginButton];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        NSLog(@"!!!");

    }
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
}

-(void)createMainView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewController = (MainViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    LeftViewController *leftViewController = (LeftViewController *)[storyboard instantiateViewControllerWithIdentifier:@"LeftViewController"];
    RightViewController *rightViewController = (RightViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RightViewController"];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [UINavigationBar appearance].tintColor = [UIColor colorFromHexString:@"689F38"];
    
    leftViewController.mainViewControler = nvc;
    
    ExSlideMenuController *slideMenuController = [[ExSlideMenuController alloc] initWithMainViewController:nvc leftMenuViewController:leftViewController rightMenuViewController:rightViewController];
    slideMenuController.automaticallyAdjustsScrollViewInsets = YES;
    slideMenuController.delegate = mainViewController;
    [self presentViewController:slideMenuController animated:YES completion:nil];
    


}

#pragma mark- Facebook
-( void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    
//    if ((error) != nil)
//    {
//        // Process error
//    }
//    else if (result.isCancelled ){
//        // Handle cancellations
//    }
//    else {
//        // If you ask for multiple permissions at once, you
//        // should check if specific permissions missing
//        if ([result.grantedPermissions containsObject:@"email"])
//        {
//            // Do work
//            NSLog(@"works");
//            
//            [self fetchProfile];
//            
//            
//            //self.performSegue(withIdentifier: "loginSegue", sender: self)
//            
//            
//        }
//    }
//    [self fetchProfile];
//    [self createMainView];
////    if(!error){
////        NSLog(@"You've Logged in");
////        NSLog(@"%@", result);
////        
////        //I want to go to anotherViewController after they log in
////        
////        [self createMainView];
////    }
    [self fetchProfile];
    
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    NSLog(@"You've Logged out");
    
}


-(void) fetchProfile {
    

    
    FBSDKGraphRequest* graphRequest = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields":@"first_name,email,last_name, picture"}];
    
    
    [graphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                              id result, NSError *error) {

        if ((error) != nil)
        {
            NSLog(@"!!Error: \(error)");

        }
        else
        {
                fbdata.user_picture_url = (NSString*)result[@"picture"][@"data"][@"url"];
                fbdata.user_lastName = (NSString*)result[@"last_name"];
                fbdata.user_firstName = (NSString*)result[@"first_name"];
//                self.user_picture_url = (NSString*)result[@"picture"][@"data"][@"url"];
//                self.user_lastName = (NSString*)result[@"last_name"];
//                self.user_firstName = (NSString*)result[@"first_name"];
                NSLog(@"### %@ %@ %@ ", fbdata.user_picture_url,fbdata.user_lastName,fbdata.user_firstName );
                [self createMainView];
            

            
            //self.user_picture_url = info.valueForKey("picture")?.valueForKey("data")?.valueForKey("url") as? String
//            self.resetFBCoreData()
//            self.setFBCoreData(last_name: data["last_name"] as! String, first_name: data["first_name"] as! String, email: data["email"] as! String )
//            //print("!!!", self.user_email,self.user_lastName, self.user_firstName )
//            self.performSegue(withIdentifier: "loginSegue", sender: self)
            
        }
        


    }];
    
    

    
}

// MARK: -  Core Data functions
// Save to the attribute




@end
