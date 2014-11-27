//
//  JoinViewController.m
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "JoinViewController.h"
#import "AppDelegate.h"

@interface JoinViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation JoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.nameTF setDelegate:self];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[_appDelegate mcManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[_appDelegate mcManager] advertiseSelf:YES];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(512, 460);
    spinner.tag = 12;
    [self.view addSubview:spinner];
    [spinner startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.nameTF resignFirstResponder];
    
    _appDelegate.mcManager.peerID = nil;
    _appDelegate.mcManager.session = nil;
    _appDelegate.mcManager.browser = nil;
    
    [_appDelegate.mcManager.advertiser stop];
    _appDelegate.mcManager.advertiser = nil;
    
    
    [_appDelegate.mcManager setupPeerAndSessionWithDisplayName:self.nameTF.text];
    [_appDelegate.mcManager setupMCBrowser];
    [_appDelegate.mcManager advertiseSelf:YES];
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
