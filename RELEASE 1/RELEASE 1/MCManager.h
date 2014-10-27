//
//  MCManager.h
//  RELEASE 1
//
//  Created by Juan Paulo Lara on 10/24/14.
//  Copyright (c) 2014 JuanPauloLara. All rights reserved.
//
//This file is part of "Prototipo para simulador de procesos de manufactura".
//
//"Prototipo para simulador de procesos de manufactura" is free software:
//you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//"Prototipo para simulador de procesos de manufactura" is distributed in
//the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
//
// Code retrived from Gabriel Theodoropoulos tutorial
// <http://www.appcoda.com/intro-multipeer-connectivity-framework-ios-programming/>
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MCManager : NSObject <MCSessionDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;

-(void)setupPeerAndSessionWithDisplayName:(NSString *)displayName;
-(void)setupMCBrowser;
-(void)advertiseSelf:(BOOL)shouldAdvertise;

@end
