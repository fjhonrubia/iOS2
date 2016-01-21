//
//  AppDelegate.h
//  HackerBook2
//
//  Created by Fco. Javier Honrubia Lopez on 28/12/15.
//  Copyright © 2015 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGTSimpleCoreDataStack;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AGTSimpleCoreDataStack *model;

@end

