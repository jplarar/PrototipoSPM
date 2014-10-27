//
//  TestViewController.h
//  RELEASE 1
//
//  Created by Juan Paulo Lara on 10/24/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtMessage;
@property (weak, nonatomic) IBOutlet UITextView *tvChat;

- (IBAction)sendMessage:(id)sender;
- (IBAction)cancelMessage:(id)sender;

@end

