//
//  NavigationController.h
//  parttime
//
//  Created by 孙硕磊 on 4/19/15.
//  Copyright (c) 2015 dhu.cst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationController : UINavigationController
-(void) customNavigationBar;
-(void) customTarBarItem;
-(void) setRootViewController:(UIViewController *) rootViewController;
-(UIViewController *) rootViewController;
@end
