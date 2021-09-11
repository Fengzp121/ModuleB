//
//  ViewController.m
//  ModuleB
//
//  Created by ffzp on 2021/9/11.
//

#import "ViewController.h"
#import "DictSearchRequest.h"
#import "BMainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:[BMainViewController new]];
        [self presentViewController:vc animated:YES completion:nil];
    });

}


@end
