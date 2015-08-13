//
//  WSNavigationController.m
//  QQ
//
//  Created by weida on 15/8/13.
//  Copyright (c) 2015年 weida. All rights reserved.
//

#import "WSNavigationController.h"

/**
 *  @brief  获取当前系统版本号
 */
#define kCurrentVersion      ([[[UIDevice currentDevice]systemVersion]floatValue])

#define kBkColorNavigaion   ([UIColor colorWithRed:0.204 green:0.722 blue:0.918 alpha:1])


@interface WSNavigationController ()

@end

@implementation WSNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetupNavStyle];
    // Do any additional setup after loading the view.
}


-(void)SetupNavStyle
{
    UIColor *BkColor = kBkColorNavigaion;
    if (kCurrentVersion < 7.0f)
    {
        [self.navigationBar setBackgroundImage:[[WSNavigationController CreateImageWithColor:BkColor] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)] forBarMetrics:UIBarMetricsDefault];
        if (kCurrentVersion > 6.f)
        {
            //去掉导航栏下边的投影
            self.navigationBar.shadowImage = [[WSNavigationController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
        }
    }else
    {
        [self.navigationBar setBackgroundImage:[[WSNavigationController CreateImageWithColor:BkColor] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 1, 5, 1)] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.tintColor = [UIColor whiteColor];
        //去掉导航栏下边的投影
        self.navigationBar.shadowImage = [[WSNavigationController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    }
    self.navigationBar.barStyle = UIBarStyleBlack;
}

+ (UIImage *)CreateImageWithColor: (UIColor *) color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end