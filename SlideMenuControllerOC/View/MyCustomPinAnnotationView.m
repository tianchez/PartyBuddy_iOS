//
//  MyCustomPinAnnotationView.m
//  MyCustomPinProject
//
//  Created by Thomas Lextrait on 1/4/16.
//  Copyright © 2016 com.tlextrait. All rights reserved.
//

#import "MyCustomPinAnnotationView.h"
#import "FacebookDataSource.h"
#import "ToJoinViewController.h"

@implementation MyCustomPinAnnotationView

- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation
{
    // The re-use identifier is always nil because these custom pins may be visually different from one another
    self = [super initWithAnnotation:annotation
                     reuseIdentifier:nil];
    
    // Fetch all necessary data from the point object
    MyCustomPointAnnotation* myCustomPointAnnotation = (MyCustomPointAnnotation*) annotation;
    self.price = myCustomPointAnnotation.price;
    
    // Callout settings - if you want a callout bubble
    self.canShowCallout = YES;
    self.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    
    FacebookDataSource* fbdata = [FacebookDataSource sharedInstance];
    NSURL *url = [NSURL URLWithString:fbdata.user_picture_url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.image = [[UIImage alloc] initWithData:data];
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(4, 5, 30, 25)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.text = [NSString stringWithFormat:@"$%d", self.price];
    label.font = [label.font fontWithSize:9];
    [self addSubview:label];
    
    return self;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    UIView* hitView = [super hitTest:point withEvent:event];
    if (hitView != nil)
    {
        [self.superview bringSubviewToFront:self];
    }
    NSLog(@"hittest!");

    return hitView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect rect = self.bounds;
    NSLog(@"inside");
    BOOL isInside = CGRectContainsPoint(rect, point);
    if(!isInside)
    {
        for (UIView *view in self.subviews)
        {
            isInside = CGRectContainsPoint(view.frame, point);
            if(isInside)
                break;
        }
    }
    return isInside;
}

@end
