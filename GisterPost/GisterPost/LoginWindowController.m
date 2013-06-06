//
//  LoginWindowController.m
//  GisterPost
//
//  Created by Thomas Blitz on 06/06/13.
//  Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import "LoginWindowController.h"

@interface LoginWindowController ()

@end

@implementation LoginWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithDelegate:(id<LoginProtocol>)delegate
{
    NSLog(@"INIT");
	if ([super init]){
        [NSBundle loadNibNamed:@"LoginWindow" owner:self];
        _delegate = delegate;
        
        NSLog(@"Loaded NIB");
    }
	
	
	return self;
}

- (IBAction)loginToGitHub:(id)sender;
{
    
}

- (IBAction)cancelLogin:(id)sender {
    
    [self.delegate userCancelledLogin];
    [self.mainWindow orderOut:sender];
}

- (void) showLoginWindow{
    [self.mainWindow center];
	[self.mainWindow makeKeyAndOrderFront:self];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

-(void)dealloc{
    _username = nil;
    [_username dealloc];
    
    _password = nil;
    [_password dealloc];
    
    
    _mainWindow = nil;
    [_mainWindow release];
    
    [super dealloc];
    
    
}

- (void)CallDelegateWithUserCredentialAndError:(NSError **)error{
    if ([self.delegate respondsToSelector:@selector(userCredentialsCreated:WithError:)]){
        UserCredential *uCred = [[UserCredential alloc]initWithUsernam:self.username andPassword:self.password];
        
        [self.delegate userCredentialsCreated:uCred WithError:error];
    }
}

@end
