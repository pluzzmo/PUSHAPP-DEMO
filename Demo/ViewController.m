//
//  ViewController.m
//  Demo
//
//  Created by Ramzi BOUKERI on 16/08/2016.
//  Copyright © 2016 Ramzi BOUKERI. All rights reserved.
//

#import "ViewController.h"
#import <PushApp/PushApp.h>
#define kAppIdProd @"xGmVfyp1ko9e25u2PXub0RJerMYZEJ1IOaBZjkq3"
#define kDeviceToken @"deviceToken"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerDevice:(id)sender {
    NSData *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:kDeviceToken];
    [[PushAppCore sharedInstance] registerDevice:kAppIdProd deviceToken:deviceToken mode:PROD useLocation:YES];
    [self viewDidAppear:YES];
}

@end
