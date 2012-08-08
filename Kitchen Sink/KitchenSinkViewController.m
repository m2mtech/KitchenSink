//
//  KitchenSinkViewController.m
//  Kitchen Sink
//
//  Created by Martin Mandl on 08.08.12.
//  Copyright (c) 2012 m2m. All rights reserved.
//

#import "KitchenSinkViewController.h"

@interface KitchenSinkViewController ()

@end

@implementation KitchenSinkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
