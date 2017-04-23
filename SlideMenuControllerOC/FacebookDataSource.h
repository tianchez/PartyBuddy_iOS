//
//  FacebookDataSource.h
//  PartyBuddy
//
//  Created by 张天琛 on 4/23/17.
//  Copyright © 2017 pluto-y. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FacebookDataSource : NSObject
{
   NSString* _user_firstName;
   NSString* _user_lastName;
   NSString* _user_picture_url;
   NSNumber* _longitute;
   NSNumber* _latitude;
    
}

+ (FacebookDataSource *)sharedInstance;

@property (nonatomic, strong) NSString* user_firstName;
@property (nonatomic, strong) NSString* user_lastName;
@property (nonatomic, strong) NSString* user_picture_url;
@property (nonatomic, strong) NSNumber* longitute;
@property (nonatomic, strong) NSNumber* latitude;

@end


