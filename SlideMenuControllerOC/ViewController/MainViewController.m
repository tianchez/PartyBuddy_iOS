//
//  MainViewController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#define METERS_MILE 1609.344
#define METERS_FEET 3.28084

#import "MainViewController.h"
#import "SubContentsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MyCustomPointAnnotation.h"
#import "MyCustomPinAnnotationView.h"
#import "ToJoinViewController.h"
#import "AFHTTPSessionManager.h"
#import "FacebookDataSource.h"



@interface MainViewController() {

}

@end

@implementation MainViewController

CLLocation *location;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarItem];
    self.navigationController.navigationBar.topItem.title = @"Home";
    
    [[self mapView] setShowsUserLocation:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.mapView.showsUserLocation = YES;
    self.mapView.zoomEnabled = YES;
    self.mapView.delegate = self;
    
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self locationManager] setDelegate:self];
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self locationManager] startUpdatingLocation];
    
    [self.reloadButton addTarget:self action:@selector(reloadClicked) forControlEvents:UIControlEventTouchUpInside];

}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarItem];
    self.navigationController.navigationBar.topItem.title = @"Home";
}

-(void) reloadClicked
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://54.69.197.209/refresh/" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"$$$JSON: %@", responseObject);
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
        NSLog(@"Array: %@", jsonArray);
        
        MyCustomPointAnnotation* point1 = [[MyCustomPointAnnotation alloc] init];
        point1.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude+0.001, location.coordinate.longitude+0.001);
        point1.title = @"Where am I?";
        point1.subtitle = @"I'm here!!!";
        [self.mapView addAnnotation:point1];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"$$$Error: %@", error);
    }];

    
//    MyCustomPointAnnotation* point1 = [[MyCustomPointAnnotation alloc] init];
//    point1.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude+0.001, location.coordinate.longitude+0.001);
//    point1.title = @"Where am I?";
//    point1.subtitle = @"I'm here!!!";
//    [self.mapView addAnnotation:point1];
    
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = location.coordinate;
//    point.title = @"Where am I?";
//    point.subtitle = @"I'm here!!!";
//    
//    [self.mapView addAnnotation:point];
}


- (MKAnnotationView*)mapView:(MKMapView *)mapView
           viewForAnnotation:(id<MKAnnotation>)annotation
{
    // Don't do anything if it's the user's location point
    if([annotation isKindOfClass:[MKUserLocation class]]) return nil;
    
    // We could display multiple types of point annotations
    if([annotation isKindOfClass:[MyCustomPointAnnotation class]]){
        MyCustomPinAnnotationView* pin = [[MyCustomPinAnnotationView alloc] initWithAnnotation:annotation];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        UITapGestureRecognizer *singlePinFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handlePinTap:)];
        [pin addGestureRecognizer:singlePinFingerTap];
        return pin;
    }
    
    return nil;
}

- (void)handlePinTap:(UITapGestureRecognizer *)recognizer
{
    //CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    
    //Do stuff here...
    [self attendEventsFromJava];
    NSLog(@"######");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ToJoinViewController *toJoinViewController = (ToJoinViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"ToJoinViewController"];
    [self presentViewController:toJoinViewController animated:YES completion:nil];
}

- (void) attendEventsFromJava
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *params = @{@"action": @"attend",
                             @"username": @"zhang783zexia",
                             @"partyID": @"232390"};
    [manager POST:@"http://54.69.197.209/update/" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"$$$JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"$$$Error: %@", error);
    }];
    
    
//    [manager GET:@"http://54.69.197.209/refresh/" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog(@"$$$JSON: %@", responseObject);
//        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
//        
//        NSLog(@"Array: %@", jsonArray);
//      
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"$$$Error: %@", error);
//    }];

}



//- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    static NSString *SFAnnotationIdentifier = @"SFAnnotationIdentifier";
//    MKPinAnnotationView *pinView =
//    (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
//    if (!pinView)
//    {
//        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:SFAnnotationIdentifier];
//        
//        annotationView.canShowCallout = YES;
//        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        UIImage *flagImage = [UIImage imageNamed:@"reload"];
//        // You may need to resize the image here.
//        annotationView.image = flagImage;
//        return annotationView;
//    }
//    else
//    {
//        pinView.annotation = annotation;
//    }
//    return pinView;
//}

//- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
//{
//    NSLog(@"sssss");
//}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

#pragma mark- Mapkit

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    location = locations.lastObject;
    [[self labelLatitude] setText:[NSString stringWithFormat:@"%.6f",
                                   location.coordinate.latitude]];
    [[self labelLongitude] setText:[NSString stringWithFormat:@"%.6f",
                                    location.coordinate.longitude]];
    [[self labelAltitude] setText:[NSString stringWithFormat:@"%.2f feet",
                                   location.altitude*METERS_FEET]];
    
    FacebookDataSource* fbdata = [FacebookDataSource sharedInstance];
    fbdata.longitute = [NSNumber numberWithDouble:location.coordinate.longitude];
    fbdata.latitude = [NSNumber numberWithDouble:location.coordinate.latitude];
    
    // zoom the map into the users current location
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance
    (location.coordinate, 0.2*METERS_MILE, 0.2*METERS_MILE);
    [[self mapView] setRegion:viewRegion animated:YES];
}

//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//        MKCoordinateRegion mapRegion;
//        mapRegion.center = mapView.userLocation.coordinate;
//        mapRegion.span.latitudeDelta = 0.2;
//        mapRegion.span.longitudeDelta = 0.2;
//
//        [self.mapView setRegion:mapRegion animated: YES];
//
//    
//}

#pragma makr - SlideMenuControllerDelegate
-(void)leftWillOpen {
    NSLog(@"SlideMenuControllerDelegate: leftWillOpen");
}

-(void)leftDidOpen {
    NSLog(@"SlideMenuControllerDelegate: leftDidOpen");
}

-(void)leftWillClose {
    NSLog(@"SlideMenuControllerDelegate: leftWillClose");
}

-(void)leftDidClose {
    NSLog(@"SlideMenuControllerDelegate: leftDidClose");
}

-(void)rightWillOpen {
    NSLog(@"SlideMenuControllerDelegate: rightWillOpen");
}

-(void)rightDidOpen {
    NSLog(@"SlideMenuControllerDelegate: rightDidOpen");
}

-(void)rightWillClose {
    NSLog(@"SlideMenuControllerDelegate: rightWillClose");
}

-(void)rightDidClose {
    NSLog(@"SlideMenuControllerDelegate: rightDidClose");
}

@end
