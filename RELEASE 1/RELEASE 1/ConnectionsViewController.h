//
//  ConnectionsViewController.h
//  RELEASE 1
//
//  Created by Juan Paulo Lara on 10/24/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "AppDelegate.h"


@interface ConnectionsViewController : UIViewController <MCBrowserViewControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITableView *tblConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;
@property (nonatomic, strong) AppDelegate *appDelegate;

- (IBAction)browseForDevices:(id)sender;
- (IBAction)toggleVisibility:(id)sender;
- (IBAction)disconnect:(id)sender;

@end


