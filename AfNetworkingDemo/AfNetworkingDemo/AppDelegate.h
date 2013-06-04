//
//  AppDelegate.h
//  AfNetworkingDemo
//
//  Created by Thomas Blitz on 04/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AfNetworkingDemoIncrementalStore.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
