
//
//  LocationFetching.m
//  testGeo
//
//  Created by felix on 16/4/14.
//  Copyright © 2016年 felix. All rights reserved.
//

#import "LocationFetching.h"

@interface LocationFetching ()<CLLocationManagerDelegate>
@property(nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic, strong)  CLLocation *currLocation;

@property (nonatomic,strong) NSString* latitude;
@property (nonatomic,strong) NSString* longitude;
@property (nonatomic,strong) NSString* altitude;

@end

@implementation LocationFetching

- (void)fillVariableAtInitState{
    //定位服务管理对象初始化
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager requestAlwaysAuthorization];
    //设置要求的请准度
    _locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    //300米会更新一次，
    _locationManager.distanceFilter = 300.0f;
    [self startLocation];
    
}

-(void)startLocation{
    [_locationManager startUpdatingLocation];
}

- (void)stopLocation{
    [_locationManager stopUpdatingLocation];
}

#pragma mark Core Location委托方法用于实现位置的更新
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _currLocation = [locations lastObject];
    
    self.latitude = [NSString stringWithFormat:@"%3.5f",_currLocation.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%3.5f",_currLocation.coordinate.longitude];
    self.altitude = [NSString stringWithFormat:@"%3.5f",_currLocation.altitude];
    
    NSLog(@"lat is : %@",self.latitude);
    NSLog(@"long is : %@",self.longitude);
    NSLog(@"alt is : %@",self.altitude);

    [self.locationDelegate getLatitude:self.latitude withLongitude:self.longitude withAltitude:self.altitude];
    
    [self reverseGeocode];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (void)reverseGeocode{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //注意编码与反编码的过程中需要消耗的时间比较长
    //反编码串 将查询的结果返回给placemarks这个数组参数
    [geocoder reverseGeocodeLocation:_currLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count] > 0) {
            
            //这个是定位上的地标，还有对应的是地图上的地标
            CLPlacemark *placemark = placemarks[0];
            
            NSDictionary *addressDictionary =  placemark.addressDictionary;

            //这里用到了通讯录
            NSString *address = [addressDictionary
                                 objectForKey:(NSString *)kABPersonAddressStreetKey];
            address = address == nil ? @"": address;
            
            NSString *state = [addressDictionary
                               objectForKey:(NSString *)kABPersonAddressStateKey];
            state = state == nil ? @"": state;
            NSString *city = [addressDictionary
                              objectForKey:(NSString *)kABPersonAddressCityKey];
            city = city == nil ? @"": city;//这个是一个判断的连用
            NSString *locationText = [NSString stringWithFormat:@"%@%@%@",state, address,city];//编程字符串
            [self dealWithLocationIfSame:locationText];
        }
    }];
}

- (void)dealWithLocationIfSame:(NSString *)location {
    [self.locationDelegate getBackLocationString:location];
}


@end

