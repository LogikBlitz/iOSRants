//
//  BTAppDelegate.m
//  BTGithubEngineTestApp
//
//  Created by Thomas Blitz on 07/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import "BTAppDelegate.h"
#import "BTGitHubEngine.h"

@implementation BTAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *gist = [[NSString alloc] initWithFormat:@"This is a test gist"];
    [gist retain];
    
    BTGitHubEngine *engine = [[BTGitHubEngine alloc]initWithUsername:@"mvagusta.ago@gmail.com" password:@"Master1109"withReachability:NO];
    [engine retain];
    
    
    
    
    
}

@end
