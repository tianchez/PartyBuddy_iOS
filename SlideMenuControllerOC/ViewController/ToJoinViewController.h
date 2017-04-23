//
//  ToJoinViewController.h
//  PartyBuddy
//
//  Created by 张天琛 on 4/23/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import "ViewController.h"

@interface ToJoinViewController : ViewController
@property (weak, nonatomic) IBOutlet UIButton *CancelButton;
@property (weak, nonatomic) IBOutlet UIButton *joinButton;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
