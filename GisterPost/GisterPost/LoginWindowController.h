//
//  LoginWindowController.h
//  GisterPost
//
//  Created by Thomas Blitz on 06/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LoginProtocol.h"

@interface LoginWindowController : NSWindowController 
@property (assign) IBOutlet NSView *mainView;
@property (assign) IBOutlet NSWindow *mainWindow;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, weak) id<LoginProtocol> delegate;

- (IBAction)loginToGitHub:(id)sender;

- (IBAction)cancelLogin:(id)sender;

@property (assign) IBOutlet NSTextField *usernameTextField;

@property (assign) IBOutlet NSSecureTextField *passwordTextField;
- (id)initWithDelegate:(id<LoginProtocol>)delegate;

- (void) showLoginWindow;
@end
