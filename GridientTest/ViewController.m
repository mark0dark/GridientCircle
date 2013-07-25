//
//  ViewController.m
//  GridientTest
//
//  Created by lwh on 13-5-24.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "ViewController.h"
#import "MyCircle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MyCircle *circle = [[MyCircle alloc] initWithFrame:CGRectMake(110, 50, 100, 100)];
    [self.view addSubview:circle];


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
