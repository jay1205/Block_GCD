//
//  GCDViewController.m
//  block小节
//
//  Created by JHW on 17/3/20.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "GCDViewController.h"
#import "GCDSketch.h"

@interface GCDViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadGCD];
    [self backEvent];
}
- (void)loadGCD{

    GCDSketch *gcd = [[GCDSketch alloc]init];
    [gcd loadGCD];
}
- (void)backEvent{

    __weak typeof(self)weakSelf = self;
    [[_backBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
       [weakSelf dismissViewControllerAnimated:YES completion:^{
           
       }];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
