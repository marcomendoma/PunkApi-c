//
//  AppDelegate.h
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/17/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

