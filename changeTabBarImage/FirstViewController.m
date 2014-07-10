//
//  FirstViewController.m
//  changeTabBarImage
//
//  Created by Gabriel Massana on 10/07/2014.
//  Copyright (c) 2014 Gabriel Massana. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchBtn:(id)sender {
    
    // Retrieve UITabBarController
    UITabBarController *tabBarController = (UITabBarController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    
    // Get ViewControllers array
    NSArray *viewControllers = tabBarController.viewControllers;
    
    // Cast the ViewController you are interested and push the image when unselected
    ((SecondViewController*)[viewControllers objectAtIndex:1]).tabBarItem.image = [[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    // Cast the ViewController you are interested and push the image when selected
    ((SecondViewController*)[viewControllers objectAtIndex:1]).tabBarItem.selectedImage = [[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    // You can use this method to push the ViewController, too.
    //[tabBarController setSelectedIndex:1];
    
    [self blink:((SecondViewController*)[viewControllers objectAtIndex:1])];
}


- (void)blink: (SecondViewController*) viewControllers {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        // Cast the ViewController you are interested and push the image when unselected
        viewControllers.tabBarItem.image = nil;
        
        // Cast the ViewController you are interested and push the image when selected
        viewControllers.tabBarItem.selectedImage = nil;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            // Cast the ViewController you are interested and push the image when unselected
            viewControllers.tabBarItem.image = [[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
            
            // Cast the ViewController you are interested and push the image when selected
            viewControllers.tabBarItem.selectedImage = [[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
        });
    });
}

@end
