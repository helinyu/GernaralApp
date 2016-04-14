//
//  LocationFetching.h
//  testGeo
//
//  Created by felix on 16/4/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <AddressBook/AddressBook.h>


@protocol LocationFetchingDelegate <NSObject>
@required
- (void)getBackLocationString:(NSString *)locationStr;
@optional
- (void)getLatitude:(NSString *)latitude withLongitude:(NSString *)longitude withAltitude:(NSString *)altitude;

@end

@interface LocationFetching : NSObject
@property (nonatomic,weak) id<LocationFetchingDelegate> locationDelegate;

- (void)stopLocation;
-(void)startLocation;
- (void)fillVariableAtInitState;

@end
