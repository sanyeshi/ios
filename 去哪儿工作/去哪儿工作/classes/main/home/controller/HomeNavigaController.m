//
//  HomeViewController.m
//  parttime
//
//  Created by 孙硕磊 on 3/26/15.
//  Copyright (c) 2015 dhu.cst. All rights reserved.
//
#import "HomeNavigaController.h"
#import "HomeRootViewController.h"

@interface HomeNavigaController ()
{
     CGRect _tabBarFrame;
}
@end

@implementation HomeNavigaController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rootViewController=[[HomeRootViewController alloc] init];
    self.delegate=self;
}

#pragma mark 自定义tabBarItem
-(void) customTarBarItem
{
    
    UIImage * image=[UIImage imageNamed:@"tabbar_homepage.png"];
    UIImage * selectedImage=[UIImage imageNamed:@"tabbar_homepage_ac.png"];
    selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"首页" image:image selectedImage:selectedImage];
}

#pragma mark 视图切换
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSUInteger count=navigationController.viewControllers.count;
    if (count>1)
    {
        UIViewController * rootViewController=self.rootViewController;
        UIViewController * secondViewController=navigationController.viewControllers[1];
        if (viewController==secondViewController)
        {
            if (self.tabBarController.tabBar.superview!=rootViewController.view)
            {
                //在视图切换时，为了实现tabBar和控制器同步切换，需要将tabBar从父视图中移除，并添到上一个控制器的视图中;
                UITabBar * tabBar=self.tabBarController.tabBar;
                _tabBarFrame=tabBar.frame;
                [tabBar removeFromSuperview];
                //添加tabBar到根视图控制器视图
                [rootViewController.view addSubview:tabBar];
            }
        }
    }
}

-(void) navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (viewController==self.rootViewController)
    {
        if (!CGRectEqualToRect(_tabBarFrame, CGRectMake(0, 0, 0, 0)))
        {
            //还原tabBar
            UITabBar * tabBar=self.tabBarController.tabBar;
            [tabBar removeFromSuperview];
            tabBar.frame=_tabBarFrame;
            [self.tabBarController.view addSubview:tabBar];
        }
    }
}

@end
