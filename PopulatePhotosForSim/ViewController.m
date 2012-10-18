//
//  ViewController.m
//  PopulatePhotosForSim
//
//  Created by William Ho on 12/10/18.
//  Copyright (c) 2012年 William Ho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize finishLabel;

- (void)image:(UIImage *)image
    didFinishSavingWithError:(NSError *)error
    contextInfo:(void *)contextInfo
{
    if (error) {
        NSLog(@"%@", error);
    }
}

- (void) debugWritePicture
{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSArray *paths = [mainBundle pathsForResourcesOfType:@"jpg" inDirectory:@"test_photos"];
    for (NSString *path in paths) {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        if (image) {
            SEL sel = @selector(image:didFinishSavingWithError:contextInfo:);
            UIImageWriteToSavedPhotosAlbum(image, self, sel, NULL);
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i = 0; i <= 100; i++) {
        [self debugWritePicture];
    }
    self.finishLabel.text = @"finished!";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFinishLabel:nil];
    [super viewDidUnload];
}
@end
