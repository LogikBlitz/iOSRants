//
//  MasterViewController.h
//  CoreDataBasics
//
//  Created by Thomas Blitz on 03/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
