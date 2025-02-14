//
//  AppDelegate.h
//  Runloop
//
//  Created by 孙硕磊 on 7/12/15.
//  Copyright (c) 2015 dhu.cst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RunLoopContext.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (void)registerSource:(RunLoopContext *)sourceInfo;
- (void)removeSource:(RunLoopContext *)sourceInfo;

@end

