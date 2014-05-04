//
//  ViewController.m
//  FrameLibrary
//
//  Created by Mafia on 4/29/14.
//  Copyright (c) 2014 Stephen Sachson. All rights reserved.
//

#import "ViewController.h"
#include <dlfcn.h>

#define kPATH_OF_AFC_DYLIB "/Users/mafia/Documents/Projects/PrivateDylibFramework/FrameLibrary/FrameLibrary/libafc.dylib"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",NSStringFromSelector(_cmd));
	// Do any additional setup after loading the view, typically from a nib.
    NSString *p=[[NSBundle mainBundle] pathForAuxiliaryExecutable:@"libafc.dylib"];
    NSLog(@"path %@",p);
    void *afcDylib=dlopen([p UTF8String], RTLD_NOW);
    
    if (afcDylib) {
        NSLog(@"got it!");
    }
    dlclose(afcDylib);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
