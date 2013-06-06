//
//  GisterPost.m
//  GisterPost
//
//  Created by Thomas Blitz on 06/06/13.
//    Copyright (c) 2013 Thomas Blitz. All rights reserved.
//

#import "GisterPost.h"
#import "LoginWindowController.h"

@interface GisterPost()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@end


@implementation GisterPost


+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static id sharedPlugin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPlugin = [[self alloc] init];
    });
}

- (id)init {
	if (self = [super init]) {
		[[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidFinishLaunching:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
        _username = nil;
        _password = nil;
	}
	return self;
}

// Sample Action, for menu item:
- (void) applicationDidFinishLaunching: (NSNotification*) notification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(selectionDidChange:)
                                                 name:NSTextViewDidChangeSelectionNotification
                                               object:nil];
    
    NSMenuItem* editMenuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    if (editMenuItem) {
        [[editMenuItem submenu] addItem:[NSMenuItem separatorItem]];
        
        NSMenuItem* newMenuItem = [[NSMenuItem alloc] initWithTitle:@"Post Gist to GitHub"
                                                             action:@selector(postGistGithub:)
                                                      keyEquivalent:@"c"];
        [newMenuItem setTarget:self];
        [newMenuItem setKeyEquivalentModifierMask: NSAlternateKeyMask];
        [[editMenuItem submenu] addItem:newMenuItem];
        [newMenuItem release];
    }
}

- (void) selectionDidChange: (NSNotification*) notification {
    if ([[notification object] isKindOfClass:[NSTextView class]]) {
        NSTextView* textView = (NSTextView *)[notification object];
        
        NSArray* selectedRanges = [textView selectedRanges];
        if (selectedRanges.count==0) {
            return;
        }
        
        NSRange selectedRange = [[selectedRanges objectAtIndex:0] rangeValue];
        NSString* text = textView.textStorage.string;
       self.selectedText = [text substringWithRange:selectedRange];
        
    }
}

- (void)postGistGithub{
    if (!self.userCredential){
        LoginWindowController *lvc = [[LoginWindowController alloc]initWithDelegate:self];
        [lvc showLoginWindow];
    }
}

- (void) showMessageBox: (id) origin {
    
    //[[NSApp mainWindow] setContentView:[lvc view]];
    
    //    NSAlert *alert = [[[NSAlert alloc] init] autorelease];
//    if (!self.selectedText || [self.selectedText isEqualToString:@""]) self.selectedText = @"Nothing was selected";
//    [alert setMessageText: self.selectedText];
//    [alert runModal];
}

#pragma mark - LoginProtocol delegateImplementation
- (void)userCredentialsCreated:(UserCredential *)credential WithError:(NSError **)error{
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _username = nil;
    [_username dealloc];
    _password = nil;
    [_password dealloc];
    
    [super dealloc];
}

@end
