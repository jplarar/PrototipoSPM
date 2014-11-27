//
//  JoinViewController.h
//  RELEASE 2
//
//  Created by Juan Paulo Lara on 11/17/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import "ViewController.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface JoinViewController : ViewController <MCBrowserViewControllerDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameTF;


@end
